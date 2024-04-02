import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginrace/User/usertrackbooking.dart';
import 'package:loginrace/User/userviewfeedback.dart';
import 'package:loginrace/User/viewallinstructors.dart';
import 'package:loginrace/User/viewgallery.dart';
import 'package:loginrace/User/viewindividualinstructor.dart';
import 'package:loginrace/User/viewtrack.dart';

class ViewTrackDetails extends StatefulWidget {
  var upcomingevents;
  var level1;
  var level2;
  String rt_id;
  
   ViewTrackDetails({Key? key, required this.rt_id, required this.level1, required this. level2, required this. upcomingevents, }) : super(key: key);

  @override
  State<ViewTrackDetails> createState() => _ViewTrackDetailsState();
}

class _ViewTrackDetailsState extends State<ViewTrackDetails> {
   

 Future<List<DocumentSnapshot>> getdata() async {
      try {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('racetrack_upload_track')
            .get();
        print('Fetched ${snapshot.docs.length} documents');
        return snapshot.docs;
      } catch (e) {
        print('Error fetching data: $e');
        throw e; // Rethrow the error to handle it in the FutureBuilder
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text('Adventure Race Track'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.upcomingevents ?? 'Events not available',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: () {
                   Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserTrackBooking(rt_id:widget.rt_id,level1:widget.level1,);
                                
                            }));
                },
                  child: _buildSessionCard('LEVEL 1', widget.level1 ?? 'LEVEL 1 not available', Colors.green)),

                  InkWell(
                    onTap: () {
                      // Handle onTap for LEVEL 2
                    },
                    child: _buildSessionCard('LEVEL 2', widget.level2 ?? 'LEVEL 2 not available', Colors.blue),
                  ),
              ],
            ),
            SizedBox(height: 20),
            _buildActionButton('OUR INSTRUCTORS', Icons.arrow_forward, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserViewAllCoach(rt_id: widget.rt_id);
              }));
            }),
            SizedBox(height: 10),
            _buildActionButton('VIEW TRACK', Icons.arrow_forward, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewTrack(rt_id: widget.rt_id);
              }));
            }),
            SizedBox(height: 10),
            _buildActionButton('VIEW GALLERY', Icons.arrow_forward, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewGallery(rt_id: widget.rt_id);
              }));
            }),
            SizedBox(height: 20),
            Text(
              'STUDENTS TESTIMONIALS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 44, 44, 45)),
            ),
            SizedBox(height: 10),
            TestimonialCard(avatar: 'TONY JOSEPH', feedback: 'I came to attend the level 1 and level 2 at Adventure Race Track Academy...'),
            TestimonialCard(avatar: 'CATHELINE', feedback: 'I came to attend the level T track academy Adventure Race Track Academy...'),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FeedbackViewPage();
                  }));
                },
                child: Text('View all', style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        color: color,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 8),
            Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
class TestimonialCard extends StatelessWidget {
  final String avatar;
  final String feedback;

  TestimonialCard({required this.avatar, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(child: Text(avatar)),
        title: Text(feedback),
      ),
    );
  }
}