import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ViewStatusPage extends StatefulWidget {
   final String name;
  final String address;
  final String mobileNumber;
  final String dueDate;
  final String imageUrl;
  final String price;
  const ViewStatusPage({super.key, required this. name, required this. address, required this. mobileNumber, required this. dueDate, required this. imageUrl, required this.price});

  @override
  State<ViewStatusPage> createState() => _ViewStatusPageState();
}

class _ViewStatusPageState extends State<ViewStatusPage> {
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('View Booking Status'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name: ${widget.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Address: ${widget.address}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Mobile Number: ${widget.mobileNumber}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Due Date: ${widget.dueDate}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Price: ${widget.price}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20), // Add space between text and button
              ElevatedButton(
                onPressed: () {
                  // Handle pending action
                  // Update the status to pending
                  // You can add your logic here
                },
                child: Text('Pending'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set button color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Set button padding
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Set button border radius
                  textStyle: TextStyle(fontSize: 16), // Set button text style
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}