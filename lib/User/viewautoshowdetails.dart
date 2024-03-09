import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/bookautoshow.dart';
import 'package:loginrace/User/chat.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ViewAutoshowDetails extends StatefulWidget {
  const ViewAutoshowDetails({super.key});

  @override
  State<ViewAutoshowDetails> createState() => _ViewAutoshowDetailsState();
}

class _ViewAutoshowDetailsState extends State<ViewAutoshowDetails> {
    int _currentIndex = 0;

  @override
   Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                'Community',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Text(
                    'Auto Shows',
                    style: TextStyle(
                      color: _currentIndex == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex == 0 ? Colors.black : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
              ),
              Tab(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Text(
                    'About',
                    style: TextStyle(
                      color: _currentIndex == 1 ? Colors.white : Colors.black87,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex == 1 ? Colors.black : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Houston Community',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            if (_currentIndex == 0)
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    // Replace this AssetImage with your actual image path
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        'images/background.jpeg', // Replace with your actual image path
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            if (_currentIndex == 1)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Color.fromARGB(255, 240, 240, 240),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'More than half of attendees to host on community. We have excellent members, all having...',
                          style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Awards',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text('Top thirty winners', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
                        Text('Major sponsor awards', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
                        SizedBox(height: 20),
                        Text(
                          'Rate',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text('Per hour - \$67/-', style: TextStyle(fontSize: 18, color: Colors.black)),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'images/community.jpg',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AutoshowBooking();
                              }),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 21, 22, 21),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'BOOK FOR SHOW',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ChatPage();
                                  }),
                                );
                              },
                              child: Icon(Icons.chat, color: Color.fromARGB(255, 243, 84, 84)),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'For more inquiries',
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 27, 13, 13)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}