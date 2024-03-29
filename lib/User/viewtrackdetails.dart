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
  String rt_id;
   ViewTrackDetails({Key? key, required this.rt_id}) : super(key: key);

  @override
  State<ViewTrackDetails> createState() => _ViewTrackDetailsState();
}

class _ViewTrackDetailsState extends State<ViewTrackDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adventure Race Track'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Sessions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              SizedBox(height: 10),
              Text('Motorcycle racing training program'),
              Text('January 26th, 27th & 28th'),
              Text('Kart motor speedway, KOVAI'),
              SizedBox(height: 10),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: () {
                    
                  },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserTrackBooking(rt_id:widget.rt_id);
                  },));
                      },
                      child: buildSessionContainer('LEVEL 1','299/-', Colors.blue,50,45))),
                  buildSessionContainer('LEVEL3', '₹25,999/-', Colors.green,50,45),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildArrowItem('OUR INSTRUCTORS',Icons.arrow_forward, () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserViewAllCoach(rt_id:widget.rt_id);
                  },));
                  }),
                  buildArrowItem('VIEW TRACK', Icons.arrow_forward, () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ViewTrack(rt_id:widget.rt_id);
                  },));
                  }),
                  buildArrowItem('VIEW GALLERY', Icons.arrow_forward, () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ViewGallery(rt_id: widget.rt_id);
                  },));
                  }),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'STUDENTS TESTIMONIALS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 44, 44, 45)),
              ),
              TestimonialCard(
                avatar: 'TONY JOSEPH',
                feedback: 'I came to attend the level 1 and level 2 at Adventure Race Track Academy...',
              ),
              TestimonialCard(
                avatar: 'CATHELINE',
                feedback: 'I came to attend the level T track academy Adventure Race Track Academy...',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return FeedbackViewPage();
                  },));
                  },
                  child: Text('View all', style: TextStyle(color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSessionContainer(String title, String price, Color color, double width, double height) {
    return Container(
      width: 95,
      height: 50,
      // padding: EdgeInsets.all(16),
      // margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(price, style: TextStyle(color: Colors.white)),
          // SizedBox(height: 8),
          // ElevatedButton(
          //   onPressed: () {
          //      Navigator.push(context, MaterialPageRoute(builder: (context) {
          //                   return UserTrackBooking();
          //         },));
          //     },
          //   // style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          //   child: Text(
          //     'BOOK NOW',
          //     style: TextStyle(color: color),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildArrowItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 8),
            Text(title, style: TextStyle(fontSize: 18, color: Colors.blue)),
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