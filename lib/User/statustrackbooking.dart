import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Rental/rentelhome.dart';
import 'package:loginrace/User/usertrackbooking.dart';
class StatusTrack extends StatefulWidget {


  StatusTrack({Key? key, }) : super(key: key);

  @override
  _StatusTrackState createState() => _StatusTrackState();
}
class _StatusTrackState extends State<StatusTrack> {
  String? selectedLevel = 'Level 1';

  Future<List<DocumentSnapshot>> getData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user_track_booking')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }
 void updateStatus(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_track_booking')
          .doc(documentId)
          .update({'status': '1'});
      print('Status updated successfully');

    } catch (e) {
      print('Error updating status: $e');
    }
  }

 void onComplete(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_track_booking')
          .doc(documentId)
          .update({'status': '2'});
      print('Status updated successfully');
                  Navigator.of(context).pop('Level1Completed'); // Pass any data if needed

    } catch (e) {
      print('Error updating status: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final List<DocumentSnapshot> documents = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: documents.map((DocumentSnapshot document) {
                      final String name = document['name'] ?? 'Name not available';
                      final String email = document['email'] ?? 'Email not available';
                      final String phone = document['phone'] ?? 'Phone not available';
                      final String place = document['place'] ?? 'Place not available';
                      final String status = document['status'] ?? 'not available';
                      final String documentId = document.id;

                      return Column(
                        children: [
                          Text(
                            'Your Booking Details',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text('Name: $name'),
                          Text('Email: $email'),
                          Text('Phone: $phone'),
                          Text('Place: $place'),
                          SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            value: selectedLevel,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLevel = newValue;
                              });
                            },
                            items: <String>['Level 1', 'Level 2']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 10),
                         Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (status == '0') {
                                  updateStatus(documentId);
                                }
                              },
                              child: Text(status == '0' ? 'Complete' : 'Completed'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (status == '0') {
                                  onComplete(documentId);
                                }
                              },
                              child: Text(status == '0' ? 'Pending' : 'Level 1 completed'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
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