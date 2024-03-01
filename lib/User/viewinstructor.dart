import 'package:flutter/material.dart';

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
         
          },
        ),
        title: Text('OUR INSTRUCTORS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           SizedBox(height: 16),
            Container(
              child: Image.asset('images/auto3.jfif'),
            ),
            Text(
              'NAVANEETH MURALI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text(
                'BE MY COACH',
                style: TextStyle(color: Color.fromARGB(255, 56, 55, 55)),
              ),
            ),
SizedBox(height: 16),
            Text('Started his track riding days in Dec 2013'),
            Text('He is an expert in teaching beginners'),
          ],
        ),
      ),





    );
  }
}