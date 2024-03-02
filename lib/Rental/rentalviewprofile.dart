import 'package:flutter/material.dart';

class RentViewProfile extends StatefulWidget {
  const RentViewProfile({super.key});

  @override
  State<RentViewProfile> createState() => _RentViewProfileState();
}

class _RentViewProfileState extends State<RentViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
          title: Text('View Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit_note_outlined),
              onPressed: () {
               
              },
            ),
          ],
        ),
        body: 
              Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 330),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/imaaaa.jpg'), 
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '123-456-7890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'City, Country',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Proof: XYZ123',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),








     ), );
  }
}