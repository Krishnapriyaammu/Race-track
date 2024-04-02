import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoachBookingStatus extends StatefulWidget {
  
  var img;
   String coach_id;
   
   CoachBookingStatus({super.key, required this.img, required this. coach_id,  });

  @override
  State<CoachBookingStatus> createState() => _CoachBookingStatusState();
}

class _CoachBookingStatusState extends State<CoachBookingStatus> {
  Future<Map<String, dynamic>> getdata() async {
  try {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('coachbooking')   .where('coach_id', isEqualTo: widget.coach_id)
                  
 // Adjust 'coach_id' to match the field name in your Firestore document

        .get();
    print('Fetched ${snapshot.docs.length} documents');
    if (snapshot.docs.isNotEmpty) {
     final document = snapshot.docs.first;
        final data = document.data() as Map<String, dynamic>;
        final date = data['date'];
        final time = data['time'];
        final level = data['level'];
        final status = data['status'];
        return {
          'date': date,
          'time': time,
          'level': level,
          'status': status,
        };
      } else {
        return {
          'date': null,
          'time': null,
          'level': null,
          'status': null,
        };
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coach Booking Status'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getdata(),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final data = snapshot.data!;
              final status = data['status'];
              final statusText = status == 1 ? 'Approved' : 'Not approved';
              final color = status == 1 ? Colors.green : Colors.red;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: widget.img != null
                              ? Image.network(
                                  widget.img,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.image),
                        ),
                      ),
                    ),
                    Text(
                      data['date'] ?? 'Date not available',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data['time'] ?? 'Time not available',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data['level'] ?? 'Level not available',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          statusText,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}