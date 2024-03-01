import 'package:flutter/material.dart';

class ViewTrackDetails extends StatefulWidget {
  const ViewTrackDetails({Key? key}) : super(key: key);

  @override
  State<ViewTrackDetails> createState() => _ViewTrackDetailsState();
}

class _ViewTrackDetailsState extends State<ViewTrackDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adventure Race Track'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Sessions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Motorcycle racing training program'),
              Text('January 26th, 27th & 28th'),
              Text('Kart motor speedway, KOVAI'),
              SizedBox(height: 20),
              Row(
                children: [
                  buildSessionContainer('LEVEL 1 & 2 (3 DAYS)', '₹21,599/-', Colors.blue,),
                  buildSessionContainer('LEVEL 3 (5 DAYS)', '₹25,999/-', Colors.green),
                  buildSessionContainer('TRACK DAYS (3 DAYS)', '₹16,999/-', Colors.orange),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildArrowItem('OUR INSTRUCTORS'),
                  buildArrowItem('VIEW TRACK'),
                  buildArrowItem('GALLERY'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'STUDENTS TESTIMONIALS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    // Handle view all testimonials
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

  Widget buildSessionContainer(String title, String price, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
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
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle booking
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'BOOK NOW',
                style: TextStyle(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArrowItem(String title) {
    return Row(
      children: [
        Text(title),
        Icon(Icons.arrow_forward),
      ],
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

