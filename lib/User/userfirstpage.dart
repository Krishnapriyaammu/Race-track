
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Common/Login.dart';
import 'package:loginrace/User/navigationuser.dart';
import 'package:loginrace/User/viewrentitems.dart';

class UserType extends StatefulWidget {
 String type;
  
  UserType({super.key, required this. type, });

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {

  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Racing Events'),
      ),
     body: ListView.builder(
        itemCount: 5, // Dummy number of racing events
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Login(type: 'user');
                }),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Event ${index + 1}', // Dummy event title
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Location: City ${index + 1}', // Dummy event location
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Date: ${DateTime.now().add(Duration(days: index)).toString().split(' ')[0]}', // Dummy event date
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Time: ${TimeOfDay(hour: 10 + index, minute: 0)}', // Dummy event time
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/event_placeholder.jpg'), // Dummy event image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.', // Dummy event description
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Login(type: 'user');
                }),
              );
            },
            tooltip: 'Rental Service',
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Login(type: 'user');
                }),
              );
            },
            tooltip: 'Community',
            child: Icon(Icons.group),
          ),
        ],
      ),
    );
  }
}