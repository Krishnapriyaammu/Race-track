import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/ticketcart.dart';

class EventTicketBooking extends StatefulWidget {
  const EventTicketBooking({super.key});

  @override
  State<EventTicketBooking> createState() => _EventTicketBookingState();
}
class _EventTicketBookingState extends State<EventTicketBooking> {
   Future<List<DocumentSnapshot>> getdata() async {
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




    String _ticketCategory = 'General category'; // Added state for dropdown value

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: FutureBuilder(
                future: getdata(),
                builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
           
           
            return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '8-10 MARCH',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Center(child: Text('RACE TEST INTERNATIONAL', style: GoogleFonts.getFont('Josefin Sans', fontSize: 28))),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'BUY YOUR TICKETS!!',
                        style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 111, 188, 251),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Total tickets\n3 days\nfrom \$65',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButton<String>(
                        value: _ticketCategory,
                        onChanged: (newValue) {
                          setState(() {
                            _ticketCategory = newValue!; 
                          });
                        },
                        items: <String>[
                          'General category',
                          'Child (3-12) + General admission'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 161, 200, 232),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '$_ticketCategory \$65', 
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ShoppingCart();
                            }));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 141, 164, 248)),
                          ),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  );
                }
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}