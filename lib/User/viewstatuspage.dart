import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/rentnotificationuser.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ViewStatusPage extends StatefulWidget {
  String rent_id;
   ViewStatusPage({super.key,  required this. rent_id, });

  @override
  State<ViewStatusPage> createState() => _ViewStatusPageState();
}

class _ViewStatusPageState extends State<ViewStatusPage> {
 Future<List<Map<String, dynamic>>> getBookingData() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> bookingSnapshot =
          await FirebaseFirestore.instance
              .collection('user_rent_booking')
              .where('rent_id', isEqualTo: widget.rent_id)
              .get();

      final List<Map<String, dynamic>> bookingDataList = [];

      for (final doc in bookingSnapshot.docs) {
        final bookingData = doc.data();
        bookingData['doc_id'] = doc.id; // Add document ID to the data
        bookingDataList.add(bookingData);
      }

      return bookingDataList;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        actions: [
          IconButton(
            onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RentNotificationUser();
              }));            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getBookingData(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final bookingDataList = snapshot.data ?? [];

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Details',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  for (final bookingData in bookingDataList) ...[
                    Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${bookingData['name'] ?? 'Not available'}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Phone Number: ${bookingData['mobile no'] ?? 'Not available'}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Due Date: ${bookingData['due_date'] ?? 'Not available'}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add action for pending button
                                },
                                child: Text('Pending'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  _showDeleteConfirmationDialog(context, bookingData);
                                },
                                child: Text('Cancel Booking'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Map<String, dynamic> bookingData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to cancel this booking?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _deleteBooking(bookingData);
              },
              child: Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteBooking(Map<String, dynamic> bookingData) async {
    try {
      await FirebaseFirestore.instance.collection('user_rent_booking').doc(bookingData['doc_id']).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking canceled')));
      setState(() {
        // Refresh the UI if necessary
      });
    } catch (e) {
      print('Error deleting booking: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to cancel booking')));
    }
  }
}