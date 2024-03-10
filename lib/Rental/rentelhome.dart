import 'package:flutter/material.dart';
import 'package:loginrace/Rental/rentalviewprofile.dart';
import 'package:loginrace/Rental/rentnotification.dart';
import 'package:loginrace/Rental/viewaccepatrequestrental.dart';
import 'package:loginrace/Rental/viewuseracceptreject.dart';

class RentalHome extends StatefulWidget {
  const RentalHome({super.key});

  @override
  State<RentalHome> createState() => _RentalHomeState();
}
class _RentalHomeState extends State<RentalHome> {
  final List<Tab> _tabs = [
    Tab(text: 'Requests'),
    Tab(text: 'Accepted'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rental Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.line_weight_outlined),
              onPressed: () {
                _showPopupMenu(context);
              },
            ),
          ],
          bottom: TabBar(
            tabs: _tabs,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.blue,
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            // Requests Tab
            _buildRequestsTab(),

            // Accepted Tab
            _buildAcceptedTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsTab() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5, // Replace with your actual data
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewUserAccept();
                }));
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 200, 225, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/imaaaa.jpg'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Krishnapriya',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Chennai'),
                          SizedBox(height: 4),
                          Text('8129724516'),
                          SizedBox(height: 4),
                          Text('Rent date - 08/9/2020'),
                          SizedBox(height: 4),
                          Text('Due date - 10/9/2020'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAcceptedTab() {
    // Replace this with the actual content of the Accepted tab
    return Center(
      child: Text('Accepted Users Tab Content'),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, 80, 0, 0),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('View Profile'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentViewProfile();
                  },));
              // Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text('View Notifications'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentNotification();
                  },));

              // Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout action
              Navigator.pop(context);
            },
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}