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
  var _hoursController = TextEditingController();
  String? documentId; // Variable to store the document ID
  bool isItemBooked = false; // Track if the item is booked

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
      // 'hours': _hoursController.text,
      'userid': userid,
      'rent_id': widget.rent_id,
      'status': 0,
      'booking_date': currentDate, // Add booking date
    });
    documentId = docRef.id;
    setState(() {
      isItemBooked = true; // Update the state to indicate the item is booked
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
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
                    child: data['image_url'] != null ? Image.network(data['image_url'] as String, fit: BoxFit.cover) : Icon(Icons.image),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    data['description'] ?? 'Description not available',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    data['price'] ?? 'Description not available',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    data['total_count'] ?? 'Description not available',
                    style: TextStyle(fontSize: 16.0),
                  ),

                  SizedBox(height: 16.0),
                  // Conditionally render the button based on whether the item is booked or not
                  isItemBooked
                      ? ElevatedButton(
                          onPressed: () {
  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ViewStatusPage( name: _nameController.text,
        address: _addressController.text,
        mobileNumber: _mobileController.text,
        dueDate: _dueDateController.text,
        imageUrl: snapshot.data!['image_url'],
        price: snapshot.data!['price'],);
                                    
                                }));                          },
                          child: Text('View Status'),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: AlertDialog(
                                    title: Text('Rent Item'),
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
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
                                        SizedBox(height: 8.0),
                                        // TextFormField(
                                        //   controller: _hoursController,
                                        //   decoration: InputDecoration(labelText: 'Total hours'),
                                        // ),
                                        SizedBox(height: 10.0),
                                        ElevatedButton(
                                          onPressed: _bookItem,
                                          child: Center(child: Text('Submit')),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text('Rent'),
                        ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}