import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/userrentviewstatus.dart';

class UserViewSingleItem extends StatefulWidget {
  var img;
  var desc;
  UserViewSingleItem({super.key, required this.img, required this.desc});

  @override
  State<UserViewSingleItem> createState() => _UserViewSingleItemState();
}

class _UserViewSingleItemState extends State<UserViewSingleItem> {
  

    var Name=TextEditingController();
    var Mobile=TextEditingController();
    var address=TextEditingController();
    var duedate=TextEditingController();
    var hours=TextEditingController();
      Future<List<DocumentSnapshot>> getData() async {
      try {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('rentaluploadimage')
            .get();
        print('Fetched ${snapshot.docs.length} documents');
        return snapshot.docs;
      } catch (e) {
        print('Error fetching data: $e');
        throw e; // Rethrow the error to handle it in the FutureBuilder
      }
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
             
              child: widget.img != null
                           ? Image.network(widget.img, fit: BoxFit.cover)
                           : Icon(Icons.image),
            ),
            SizedBox(height: 8.0),
            // Text(
            //   // style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 8.0),
            Text(
                         widget.desc ?? 'description not available',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
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
                                      controller: Name,
                                      decoration: InputDecoration(labelText: 'Full Name'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: Mobile,
                                      decoration: InputDecoration(labelText: 'Contact Number'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: address,
                                      decoration: InputDecoration(labelText: 'Address'),
                                    ),
                                      SizedBox(height: 8.0),
                                    TextFormField(
                                      controller: duedate,
                                      decoration: InputDecoration(labelText: 'Due date'),
                                    ),
                                       SizedBox(height: 8.0),

                                    TextFormField(
                                      controller: hours,
                                      decoration: InputDecoration(labelText: 'Total hours'),
                                    ),
                                    SizedBox(height: 10.0),
                                    ElevatedButton(
                                      onPressed: ()async {
                                         await FirebaseFirestore.instance
                                .collection('user_rent_booking')
                                .add({
                              'name': Name.text,
                              'address':address.text,
                              
                              'mobile no': Mobile.text,
                              'due date':duedate.text,
                              'hours':hours.text,
                             
                            });
                            print(Name.text);
                            
                             
                              print(Mobile.text);
                             
                                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserRentViewStatus();
                  },));
                                        // Navigator.of(context).pop();
                                      },
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