import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/instructorbooking.dart';

class ViewInstructor extends StatefulWidget {
  const ViewInstructor({super.key});

  @override
  State<ViewInstructor> createState() => _ViewInstructorState();
}

class _ViewInstructorState extends State<ViewInstructor> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Our Instructors',
                style: GoogleFonts.getFont('Josefin Sans',fontSize: 29,
                  
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/cooo.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'NAVANEETH MURALI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserInstructorbooking();
                  },));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.blue, 
              ),
              child: Text('BE MY COACH'),
            ),
            SizedBox(height: 16),
            Text('Started his track riding days in Dec 2013'),
            SizedBox(height: 8),
            Text('He is an expert in teaching beginners'),
          ],
        ),
      ),
    );
  }
}