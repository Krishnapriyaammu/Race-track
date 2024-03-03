import 'package:flutter/material.dart';
import 'package:loginrace/Admin/adminlogin.dart';
import 'package:loginrace/Community/communitylogin.dart';
import 'package:loginrace/Racetrack/racetracklogin.dart';
import 'package:loginrace/Rental/rentallogin.dart';
import 'package:loginrace/User/userlogin.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
   String selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body:
 Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Your logo widget goes here
            Image.asset('images/logo1.png', height: 120, width: 120),
            SizedBox(height: 20),
            Text(
              'Who you are',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRadioButton('User',),
                buildRadioButton('Rental'),
                buildRadioButton('Admin'),
                buildRadioButton('Race Track'),
                buildRadioButton('Community'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //         return UserLogin();
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            // return RentalLogin();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context) {
                            // return RacetrackLogin();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context) {
                            // return CommunityLogin();
                             Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AdminLogin();
                            
                  },));
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioButton(String value) {
    return ListTile(
      title: Text(value),
      leading: Radio(
        value: value,
        groupValue: selectedRole,
        onChanged: (newValue) {
          setState(() {
            selectedRole = newValue.toString();
          });
        },
      ),
    );

    
  }
}