import 'package:flutter/material.dart';

class ViewAutoshowDetails extends StatefulWidget {
  const ViewAutoshowDetails({super.key});

  @override
  State<ViewAutoshowDetails> createState() => _ViewAutoshowDetailsState();
}

class _ViewAutoshowDetailsState extends State<ViewAutoshowDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 102, 102), // Change app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
               child: Text(
                'HOUSTON COMMUNITY',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 13, 13)),
                           ),
             ),
            SizedBox(height: 16),
            Text(
              'About',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 13, 13)),
            ),
            Text(
              'More than half of attendees to host on community...',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Awards',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 13, 13)),
            ),
            Text('Top thirty winners', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
            Text('Major sponsor awards', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
            SizedBox(height: 20),
            Text(
              'Rate',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 13, 13)),
            ),
            Text('Per hour - \$67/-', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 14, 13, 13))),
            SizedBox(height: 20),
            Image.asset(
              'images/auto3.jfif',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle booking logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 21, 22, 21), // Change button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(
                'BOOK FOR SHOW',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.green),
                 SizedBox(width: 10,),
                Text(
                  '+918589282042', // Replace with actual phone number
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              children: [
                Icon(Icons.chat, color: Color.fromARGB(255, 243, 84, 84)), // Chat icon
                SizedBox(width: 8),
                Text(
                  'For more inquiries',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 27, 13, 13)),
                ),
              ],
            ),
          ],
        ),
      ),







    );
  }
}