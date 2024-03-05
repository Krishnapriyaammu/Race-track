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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
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
                                    radius: 15,
                                    backgroundImage: AssetImage('images/racing.jpg'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 100),
                                  child: Text(
                                    'Formula Race Test',
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
                                      'CUIDED DEL MOTOR',
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
                                        '3-10-2024',
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
                                        'Tickets available (100)',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}