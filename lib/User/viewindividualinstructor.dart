import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/viewstatusinstructorbooking.dart';

class ViewInstructor extends StatefulWidget {
  const ViewInstructor({super.key});
  

  @override
  State<ViewInstructor> createState() => _ViewInstructorState();
}
class _ViewInstructorState extends State<ViewInstructor> {
  final TextEditingController bookingDetailsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  // String selectedLevel = "LEVEL 1";

  final List<String> _list = ['LEVEL 1', 'LEVEL 2', 'LEVEL 3', 'LEVEL 4'];

  void showBookingRequestPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text(
              "Booking Request",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Provide essential details for booking:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Date of Training (e.g., MM/DD/YYYY)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: 'Time of Training (e.g., HH:MM AM/PM)',
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  value: bookingDetailsController.text.isNotEmpty ? bookingDetailsController.text : null,
                  hint: Text('Levels'),
                  onChanged: (value) {
                    setState(() {
                      bookingDetailsController.text = value.toString();
                    });
                  },
                  items: _list.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  String selectedLevel = bookingDetailsController.text;

                  if (selectedLevel.isEmpty) {
                    // Show an error message or handle it appropriately
                    return;
                  }

                  await FirebaseFirestore.instance.collection("coachbooking").add({
                    'date': dateController.text,
                    'time': timeController.text,
                    'level': selectedLevel,
                  });

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return MyBookingsStatusPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text("Send Request"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text("Cancel"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Our Instructors',
                  style: GoogleFonts.getFont(
                    'Josefin Sans',
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/cooo.jpg'),
              ),
              SizedBox(height: 16),
              Text(
                'NAVANEETH MURALI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  showBookingRequestPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                ),
                child: Text('BE MY COACH'),
              ),
              SizedBox(height: 16),
              Text('Started his track riding days in Dec 2013'),
              SizedBox(height: 8),
              Text('He is an expert in teaching beginners'),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBookingsStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Status'),
      ),
      body: Center(
        child: Text('Your booking request has been submitted!'),
      ),
    );
  }
}
