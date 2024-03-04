import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewRentRequest extends StatefulWidget {
  const ViewRentRequest({super.key});

  @override
  State<ViewRentRequest> createState() => _ViewRentRequestState();
}

class _ViewRentRequestState extends State<ViewRentRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted requests'),
        backgroundColor: Color.fromARGB(255, 235, 142, 148),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/imaaaa.jpg'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 215, 213, 210),
                              ),
                              child: SizedBox(
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.asset(
                                          'images/auto2.jfif',
                                          height: 130,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20, width: 20),
                                        Text(
                                          'Krishnapriya',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on, size: 16),
                                            Text('Chennai'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.phone, size: 16),
                                            Text('8129724516'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_today, size: 16),
                                            Text('Rent date-08/9/2020'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_today, size: 16),
                                            Text('Due date-10/9/2020'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
