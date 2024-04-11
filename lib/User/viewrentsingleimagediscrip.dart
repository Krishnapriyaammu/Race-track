import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/userfirstpage.dart';
import 'package:loginrace/User/viewstatuspage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewSingleItem extends StatefulWidget {
  final String rent_id;
  
  UserViewSingleItem({Key? key, required this.rent_id}) : super(key: key);

  @override
  State<UserViewSingleItem> createState() => _UserViewSingleItemState();
}

class _UserViewSingleItemState extends State<UserViewSingleItem> {
  var _nameController = TextEditingController();
  var _mobileController = TextEditingController();
  var _placeController = TextEditingController();
  var _dueDateController = TextEditingController();
  var _quantityController = TextEditingController();
  var _addressController = TextEditingController(); // Controller for quantity
  String? documentId; // Variable to store the document ID

  int _selectedQuantity = 1; // Default selected quantity
  late Map<String, dynamic>
      _rentalImageData; // Store rental image data

  // Fetch rental image data and user details
  Future<void> _fetchRentalImageData() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      var userId = sp.getString('uid');

      // Fetch user details based on the logged-in user's ID
      final userSnapshot = await FirebaseFirestore.instance
          .collection('user_register')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        final userData = userSnapshot.data() as Map<String, dynamic>;
        setState(() {
          // Populate the text controllers with the fetched user details
          _nameController.text = userData['name'] ?? '';
          _mobileController.text = userData['phone'] ?? '';
          _placeController.text = userData['place'] ?? '';
        });
      } else {
        print('User data not found for ID: $userId');
      }

      final snapshot = await FirebaseFirestore.instance
          .collection('user_rent_booking')
          .doc(widget.rent_id) // Fetch user_rent_booking document by rent_id
          .get();
      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        final rentalUploadImageId = userData['rental_upload_image_id'];
        if (rentalUploadImageId != null) {
          final rentalImageSnapshot = await FirebaseFirestore.instance
              .collection('rental_upload_image')
              .doc(rentalUploadImageId)
              .get();
          if (rentalImageSnapshot.exists) {
            setState(() {
              _rentalImageData =
                  rentalImageSnapshot.data() as Map<String, dynamic>;
            });
          } else {
            print(
                'Rental image data not found for ID: $rentalUploadImageId');
          }
        } else {
          print(
              'rental_upload_image_id not found in user_rent_booking document');
        }
      } else {
        print(
            'user_rent_booking document not found for ID: ${widget.rent_id}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchRentalImageData();
  }

  Future<void> _bookItem() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userid = sp.getString('uid');
    var currentDate = DateTime.now(); // Get current date and time

    // Get the correct rent_id from the rental_upload_image document
    var rentId = widget.rent_id;
  double totalPrice = (_rentalImageData['price'] as num).toDouble() * _selectedQuantity;

    DocumentReference docRef = await FirebaseFirestore.instance
        .collection('user_rent_booking')
        .add({
      'name': _nameController.text,
      'place': _placeController.text,
      'mobile no': _mobileController.text,
      'due_date': _dueDateController.text,
      'address': _addressController.text,
      'quantity': _selectedQuantity, // Include selected quantity
      'userid': userid,
      'rent_id': widget.rent_id, // Set the correct rent_id here
      'status': 0,
      'booking_date': currentDate,
          'total_price': totalPrice, // Include total price
 // Add booking date
    });
    documentId = docRef.id;

    // Update the total_count in the rental_upload_image document
    await FirebaseFirestore.instance
        .collection('rental_upload_image')
        .doc(rentId) // Use the correct rent_id here
        .update({
      'total_count': (_rentalImageData['total_count'] as int) -
          _selectedQuantity,
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('rental_upload_image')
              .doc(widget.rent_id)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              var data = snapshot.data!.data() as Map<String, dynamic>?;

              if (data == null) {
                print('Item not found for Rent ID: ${widget.rent_id}');
                return Center(child: Text('Item not found'));
              }
              int totalCount = data['total_count'] as int;

              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(data['image_url'] as String),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text('Select Quantity: '),
                        DropdownButton<int>(
                          value: _selectedQuantity,
                          onChanged: (value) {
                            setState(() {
                              if (value! <= 3) {
                                _selectedQuantity = value;
                              } else {
                                _showCustomQuantityDialog();
                              }
                            });
                          },
                          items: List.generate(
                            3, // Generate dropdown items up to 3
                            (index) => DropdownMenuItem<int>(
                              value: index + 1,
                              child: Text((index + 1).toString()),
                            ),
                          )
                            ..add(
                              DropdownMenuItem<int>(
                                value: 4, // Value for "More"
                                child: Text('More'),
                              ),
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      data['description'] ?? 'Description not available',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Price: \$${data['price']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text('Total Count: $totalCount',
                        style: TextStyle(fontSize: 16.0)),

                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Rent button press
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Rent Item'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Enter your details to rent the item:'),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      controller: _nameController,
                                      readOnly: true,
                                      decoration:
                                          InputDecoration(labelText: 'Full Name'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _mobileController,
                                      decoration: InputDecoration(
                                          labelText: 'Contact Number'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _placeController,
                                      readOnly: true,
                                      decoration:
                                          InputDecoration(labelText: 'Place'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _addressController,
                                      decoration:
                                          InputDecoration(labelText: 'Address'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _dueDateController,
                                      readOnly: true,
                                      decoration:
                                          InputDecoration(labelText: 'Due date'),
                                      onTap: () async {
                                        // Show date picker when text field is tapped
                                        DateTime? selectedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2100),
                                        );

                                        if (selectedDate != null) {
                                          // Update the due date controller with selected date
                                          setState(() {
                                            _dueDateController.text =
                                                selectedDate
                                                    .toString()
                                                    .split(' ')[0];
                                          });
                                        }
                                      },
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                        'Selected Quantity: $_selectedQuantity'),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: _bookItem,
                                  child: Text('Submit'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Rent'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to ViewStatusPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewStatusPage(
                                    rent_id: widget.rent_id,
                                              documentId:documentId
                                              , // Pass the document ID here

                                    price: (data['price'] as num).toDouble(),
                                  )),
                        );
                      },
                      child: Text('View Status'),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  // Function to show custom quantity dialog
  void _showCustomQuantityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Quantity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Update selected quantity with custom value
                setState(() {
                  _selectedQuantity =
                      int.tryParse(_quantityController.text) ?? 1;
                  Navigator.pop(context); // Close dialog
                });
              },
              child: Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}