import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/viewstatusinstructorbooking.dart';

class ViewInstructor extends StatefulWidget {
  String id;
  var img;
  var name;
  var desc;
   ViewInstructor({super.key, required this.id,required this.name,required this.desc,required this.img});
  

  @override
  State<ViewInstructor> createState() => _ViewInstructorState();
}
class _ViewInstructorState extends State<ViewInstructor> {

   Future<List<DocumentSnapshot>> getData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('race_track_add_coach')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }
  final TextEditingController bookingDetailsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
    String imageUrl='';

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
          child: FutureBuilder(
            future: getData(),
            builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            //  final document = snapshot.data![];
            //     final data = document.data() as Map<String, dynamic>;
            //     final imageUrl = data['image_url'];
            //     final desc = data['description'];
            //     final name =data['name'];
           
            return Column(
              
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
                  Container(
                    height: 130,
                    width: 90,
                    child: widget.img != null
                           ? Image.network(widget.img, fit: BoxFit.cover)
                           : Icon(Icons.image),
                  ),
                   
                  SizedBox(height: 16),
                  Text(
                      
                   widget.name ?? 'name not available',
                    // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  Text(

                  widget.desc ?? 'description not available',
                  ),
                
                ],
              );
            }
            }
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
