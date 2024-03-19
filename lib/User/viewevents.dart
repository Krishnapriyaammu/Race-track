import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/evntticketbooking.dart';
import 'package:loginrace/User/viewprofile.dart';

class ViewEvents extends StatefulWidget {
  const ViewEvents({super.key});

  @override
  State<ViewEvents> createState() => _ViewEventsState();
}
class _ViewEventsState extends State<ViewEvents> {
 TextEditingController _searchController = TextEditingController();


 Future<List<DocumentSnapshot>> getData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('racetrack_upload_event')
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
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Viewprofile();
            }));
          },
          child: Row(
            children: [
              Icon(
                Icons.person_pin,
                size: 40,
                color: Colors.black, 
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.black), 
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white70), 
                      prefixIcon: Icon(Icons.search, color: Colors.black), 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return EventTicketBooking();
                                      }));
            },
              child: FutureBuilder(
                future: getData(),
                builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                     final document = snapshot.data![index];
                       final data = document.data() as Map<String, dynamic>;
                       final imageUrl = data['image_url'];


                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: CircleAvatar(
                                        child: imageUrl != null
                                      ? Image.network(imageUrl, fit: BoxFit.cover)
                                      : Icon(Icons.image),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 100),
                                      child: Text(
                                        data['Renter Name'] ?? 'Name not available',
                                        style: GoogleFonts.getFont(
                                          'Josefin Sans',
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue, 
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 196, 195, 195),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.blue, Colors.white], 
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.circular(50)),
                                      Image.asset('images/racing.jpg', height: 200),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                     data['Renter Name'] ?? 'Name not available',
                                          style: GoogleFonts.getFont(
                                            'Josefin Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white, 
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.calendar_month, color: Colors.white), 
                                          ),
                                          Text(
                                            data['Renter Name'] ?? 'Name not available',
                                            style: TextStyle(color: Colors.white), 
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.assistant_photo, color: Colors.white),
                                          ),
                                          Text(
                                            data['Renter Name'] ?? 'Name not available',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}