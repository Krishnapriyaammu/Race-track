import 'package:flutter/material.dart';
import 'package:loginrace/User/userrentviewstatus.dart';
class RentalItem {
  final String name;
  final String description;
  final String imagePath;

  RentalItem({required this.name, required this.description, required this.imagePath});
}


class UserViewSingleItem extends StatelessWidget {
    final RentalItem item;

const UserViewSingleItem({Key? key, required this.item}) : super(key: key);

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
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              item.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              item.description,
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
                                      decoration: InputDecoration(labelText: 'Full Name'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      decoration: InputDecoration(labelText: 'Contact Number'),
                                    ),
                                    SizedBox(height: 8.0),
                                    TextFormField(
                                      decoration: InputDecoration(labelText: 'Address'),
                                    ),
                                      SizedBox(height: 8.0),
                                    TextFormField(
                                      decoration: InputDecoration(labelText: 'Due date'),
                                    ),
                                    SizedBox(height: 10.0),
                                    ElevatedButton(
                                      onPressed: () {
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


    
  
