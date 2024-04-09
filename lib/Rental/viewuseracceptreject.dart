import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Rental/viewaccepatrequestrental.dart';

class ViewUserAccept extends StatefulWidget {
  String documentId;
   ViewUserAccept({super.key, required this. documentId});

  @override
  State<ViewUserAccept> createState() => _ViewUserAcceptState();
}

class _ViewUserAcceptState extends State<ViewUserAccept> {
  bool isAccepted = false; // Track if the request is already accepted
  Color rejectButtonColor = Colors.red; // Initially set to red

  Future<Map<String, dynamic>> getUserBookingData() async {
    try {
      final DocumentSnapshot userBookingSnapshot =
          await FirebaseFirestore.instance
              .collection('user_rent_booking')
              .doc(widget.documentId) // Use the provided documentId
              .get();

      final QuerySnapshot imageSnapshot = await FirebaseFirestore.instance
          .collection('rental_upload_image')
          .get();

      if (userBookingSnapshot.exists && imageSnapshot.docs.isNotEmpty) {
        final userBookingData =
            userBookingSnapshot.data() as Map<String, dynamic>;
        final imageData = imageSnapshot.docs.first.data() as Map<String, dynamic>;
        final bookingDate = userBookingData['booking_date'];

        return {
          'userBookingData': userBookingData,
          'imageData': imageData,
          'bookingDate': bookingDate,
        };
      } else {
        return {};
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it outside
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getUserBookingData(),
            builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Data not available'));
              } else {
                final userBookingData = snapshot.data!['userBookingData'];
                final imageData = snapshot.data!['imageData'];

                return Container(
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
                      Text(userBookingData['name'] ?? 'Name not available'),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(userBookingData['address'] ?? 'Address not available'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(userBookingData['mobile no'] ?? 'Mobile number not available'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          imageData['description'] ?? 'Description not available',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Booking date: ${snapshot.data!['bookingDate'] ?? 'Booking date not available'}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(userBookingData['due_date'] ?? 'Due date not available'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
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
                          child: Image.network(
                            imageData['image_url'] ?? 'Image not available',
                            height: 150,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Accept and Reject Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // Handle accept action
                              if (!isAccepted) {
                                await FirebaseFirestore.instance
                                    .collection('user_rent_booking')
                                    .doc(widget.documentId)
                                    .update({'status': 1});

                                setState(() {
                                  isAccepted = true;
                                  rejectButtonColor = Colors.grey;
                                });
                              }
                            },
                            child: Text('Accept'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: isAccepted ? null : () {
                              // Handle reject action
                            },
                            child: Text('Reject'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: rejectButtonColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}