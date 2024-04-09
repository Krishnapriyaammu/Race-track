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
  var _addressController = TextEditingController();
  var _dueDateController = TextEditingController();
  var _quantityController = TextEditingController(); // Controller for quantity
  String? documentId; // Variable to store the document ID

  int _selectedQuantity = 1; // Default selected quantity

  Future<void> _bookItem() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userid = sp.getString('uid');
    var currentDate = DateTime.now(); // Get current date and time

    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('user_rent_booking').add({
      'name': _nameController.text,
      'address': _addressController.text,
      'mobile no': _mobileController.text,
      'due_date': _dueDateController.text,
      'quantity': _selectedQuantity, // Include selected quantity
      'userid': userid,
      'rent_id': widget.rent_id,
      'status': 0,
      'booking_date': currentDate, // Add booking date
    });
    documentId = docRef.id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('rental_upload_image').doc(widget.rent_id).get(),
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
  )..add(
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
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Price: \$${data['price']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Total Count: ${data['total_count']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
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
                                    Text('Enter your details to rent the item:'),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      controller: _nameController,
                                      decoration: InputDecoration(labelText: 'Full Name'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _mobileController,
                                      decoration: InputDecoration(labelText: 'Contact Number'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _addressController,
                                      decoration: InputDecoration(labelText: 'Address'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: _dueDateController,
                                      decoration: InputDecoration(labelText: 'Due date'),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: _bookItem,
                                  child: Text('Submit'),
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
                          MaterialPageRoute(builder: (context) => ViewStatusPage(rent_id: widget.rent_id)),
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
                  _selectedQuantity = int.tryParse(_quantityController.text) ?? 1;
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