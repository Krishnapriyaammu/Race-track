import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
        title: Text('Admin Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Users'),
              onTap: () {
                // Navigate to Users page
                print('Users pressed');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Community'),
              onTap: () {
                // Navigate to Community page
                print('Community pressed');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Race Track'),
              onTap: () {
                // Navigate to Race Track page
                print('Race Track pressed');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Rental'),
              onTap: () {
                // Navigate to Rental page
                print('Rental pressed');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'images/background.jpeg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
      




        ]),
    );
  }
}