import 'package:flutter/material.dart';
import 'package:loginrace/Rental/viewaccepatrequestrental.dart';

class ViewUserAccept extends StatefulWidget {
  const ViewUserAccept({super.key});

  @override
  State<ViewUserAccept> createState() => _ViewUserAcceptState();
}

class _ViewUserAcceptState extends State<ViewUserAccept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0, // Remove appbar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 233, 237, 245),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: 600,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundImage: AssetImage('images/imaaaa.jpg'),
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'Krishnapriya',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Chennai',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    '812972416',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Rent price: \$80',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Rent date: 08/9/2024',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Due date: 2/10/2024',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Model year: 2011',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'images/auto2.jfif',
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                // Accept and Reject Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ViewRentRequest();
                          }),
                        );
                      },
                      child: Text('Accept'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Reject action
                      },
                      child: Text('Reject'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
