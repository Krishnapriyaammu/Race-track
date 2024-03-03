import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/ticketcart.dart';

class EventTicketBooking extends StatefulWidget {
  const EventTicketBooking({super.key});

  @override
  State<EventTicketBooking> createState() => _EventTicketBookingState();
}
class _EventTicketBookingState extends State<EventTicketBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20), // Adjust the value as needed
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '8-10 MARCH',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text('RACE TEST INTERNATIONAL', style: GoogleFonts.getFont('Josefin Sans', fontSize: 20)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'BuY Your Tickets !!',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.red,
                    child: Text(
                      'Friday-Monday\n3 days\nfrom \$65',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    value: 'General category',
                    onChanged: (newValue) {
                      // Handle dropdown selection
                    },
                    items: <String>[
                      'General category',
                      'Child (3-12) + General admission'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 300,
                    color: Colors.amber,
                    child: Text('General category \$65'),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 40,
                    width: 300,
                    color: Colors.deepOrange,
                    child: Text('Child (3-12) + General admission FREE'),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ShoppingCart();
                        },));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130))),
                      child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
