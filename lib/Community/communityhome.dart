import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Community/uploadimages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewPage extends StatefulWidget {
    final List<File> selectedImages;
        ProfileViewPage({required this.selectedImages});


  @override
  _ProfileViewPageState createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {


     late String communityName;

  
  @override
 
  void initState() {
    super.initState();
    _fetchCommunityName();
  }
 Future<void> _fetchCommunityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      communityName = prefs.getString('name') ?? 'Community Name Not Available';
      

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommUploadImages()),
              );
            },
          ),
        ],
      ),
     body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text(
              communityName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Booking button press
                  },
                  child: Text('Booking'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Edit Profile button press
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.selectedImages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Image.file(
                      widget.selectedImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}