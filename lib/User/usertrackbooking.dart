import 'package:flutter/material.dart';
import 'package:loginrace/User/trackbookingpayementadd.dart';

class UserTrackBooking extends StatefulWidget {
  const UserTrackBooking({super.key});

  @override
  State<UserTrackBooking> createState() => _UserTrackBookingState();
}

class _UserTrackBookingState extends State<UserTrackBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add an icon or image for visual appeal
                      Icon(
                        Icons.sports_motorsports,
                        size: 64,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Join the Adventure!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 20),
                      buildTextFieldRow('Name', Icons.person),
                      buildTextFieldRow('Email', Icons.email),
                      buildTextFieldRow('Phone Number', Icons.phone),
                      buildTextFieldRow('Place', Icons.location_on),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return TrackBookingPayment();
                          }));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text('Next', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldRow(String label, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(icon, color: Colors.blue),
            ),
            Text(label),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: label,
            fillColor: Color.fromARGB(112, 243, 214, 214),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
