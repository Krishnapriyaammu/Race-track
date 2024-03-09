import 'package:flutter/material.dart';
import 'package:loginrace/User/autoshowaddpayementdetails.dart';

class UserRentViewStatus extends StatefulWidget {
  const UserRentViewStatus({super.key});

  @override
  State<UserRentViewStatus> createState() => _UserRentViewStatusState();
}

class _UserRentViewStatusState extends State<UserRentViewStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: Text(
          'View Status',
          // style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add Container with Image
              Container(
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/bikee.jpeg'), // Specify the path to your image
                  ),
                ),
              ),
                
              
              SizedBox(height: 16),
              Text(
                'Racing bike',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text('Due Date: 5/9/2024'),
              SizedBox(height: 8),
              Text('Price: 4500/-'),
             
              SizedBox(height: 8),
              Text('Status: APPROVED'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AutoshowAddPayement();
                  },));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 255, 122),
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text('Payement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
