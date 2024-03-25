import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/Racetrack/eventdetails.dart';
import 'package:loginrace/Racetrack/uploadeventimage.dart';
import 'package:loginrace/Racetrack/viewprofileracetrack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaceTrackViewEvents extends StatefulWidget {
  const RaceTrackViewEvents({super.key});

  @override
  State<RaceTrackViewEvents> createState() => _RaceTrackViewEventsState();
}

class _RaceTrackViewEventsState extends State<RaceTrackViewEvents> {
   TextEditingController _searchController = TextEditingController();
     String imageUrl='';




   Future<List<DocumentSnapshot>> getData() async {
    try {
        SharedPreferences sp = await SharedPreferences.getInstance();
                     var a = sp.getString('uid');

      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('racetrack_upload_event').where('uid',isEqualTo: a)
          
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            String userId = sp.getString('uid') ?? '';
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RaceTrackViewProfile(userId: userId);
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person_pin,
              size: 32,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Events',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final document = snapshot.data![index];
                final data = document.data() as Map<String, dynamic>;
                final imageUrl = data['image_url'];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventTicketAddPage()),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['event name'] ?? 'Name not available',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                data['eventowner'] ?? 'Owner not available',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(
                                    data['date'] ?? 'Date not available',
                                    style: GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RaceTrackUploadEventimage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }
}