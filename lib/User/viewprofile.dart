import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Viewprofile extends StatefulWidget {
  const Viewprofile({super.key});

  @override
  State<Viewprofile> createState() => _ViewprofileState();
}

class _ViewprofileState extends State<Viewprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(

),
body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                // backgroundImage: NetworkImage('https://example.com/profile-image.jpg'), // Replace with the user's profile image URL
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'John Doe', 
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'john.doe@example.com', // Replace with the user's email
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '+1234567890', // Replace with the user's phone number
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}