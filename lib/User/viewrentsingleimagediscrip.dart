
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/userrentviewstatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewSingleItem extends StatefulWidget {
  var img;
  var desc;
  String rent_id;
  UserViewSingleItem({super.key, required this.img, required this.desc, required  this.rent_id,});

  @override
  State<UserViewSingleItem> createState() => _UserViewSingleItemState();
}

class _UserViewSingleItemState extends State<UserViewSingleItem> {
  

    var _nameController = TextEditingController();
  var _mobileController = TextEditingController();
  var _addressController = TextEditingController();
  var _dueDateController = TextEditingController();
  var _hoursController = TextEditingController();

  bool _itemBooked = false;

  @override
  void initState() {
    super.initState();
    // Check if the item is already booked
    if (widget.rent_id.isNotEmpty) {
      setState(() {
        _itemBooked = true;
      });
    }
  }

  Future<void> _bookItem() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userid = sp.getString('uid');

    await FirebaseFirestore.instance.collection('user_rent_booking').add({
      'name': _nameController.text,
      'address': _addressController.text,
      'mobile no': _mobileController.text,
      'due_date': _dueDateController.text,
      'hours': _hoursController.text,
      'userid': userid,
      'rent_id': widget.rent_id,
      'status': 0,
    });

    setState(() {
      _itemBooked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: widget.img != null ? Image.network(widget.img, fit: BoxFit.cover) : Icon(Icons.image),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.desc ?? 'Description not available',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            _itemBooked
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserRentViewStatus(
                            img: widget.img,
                            desc: widget.desc,
                            due_date: _dueDateController.text,
                            rent_id: widget.rent_id,
                          ),
                        ),
                      );
                    },
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
                                  TextFormField(
                                    controller: _hoursController,
                                    decoration: InputDecoration(labelText: 'Total hours'),
                                  ),
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
      ),
    );
  }
}