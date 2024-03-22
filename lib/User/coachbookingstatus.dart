import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoachBookingStatus extends StatefulWidget {
  var date;
  var time;
  var level;
  var img;
 
   CoachBookingStatus({super.key, required this.date, required this.time,required this.level,required this.img});

  @override
  State<CoachBookingStatus> createState() => _CoachBookingStatusState();
}

class _CoachBookingStatusState extends State<CoachBookingStatus> {
   Future<List<DocumentSnapshot>> getdata() async {
      try {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('coachbooking')
            .get();
        print('Fetched ${snapshot.docs.length} documents');
        return snapshot.docs;
      } catch (e) {
        print('Error fetching data: $e');
        throw e; // Rethrow the error to handle it in the FutureBuilder
      }
    }
    bool _isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: Text('Coach Booking Status'),
      ),
       body: Center(
        child: FutureBuilder(
          future: getdata(),
          builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                     child: widget.img != null
                             ? Image.network(widget.img, fit: BoxFit.cover)
                             : Icon(Icons.image),
                  ),
                  Text(
                           widget.date ?? 'date not available',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                           widget.time ?? 'time not available',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                           widget.level ?? 'level not available',
                          style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _isApproved ? Colors.green : Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _isApproved ? 'Approved' : 'Not Approved',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Cancel action here
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            );
          }
          }
        ),
      ),
    );
  }
}