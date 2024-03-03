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
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
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
                    style: TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Friday-Monday\n3 days\nfrom \$65',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    value: 'General category',
                    onChanged: (newValue) {
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
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'General category \$65',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Child (3-12) + General admission FREE',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
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
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130)),
                      ),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
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