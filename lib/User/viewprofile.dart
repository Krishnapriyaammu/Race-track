import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/Common/Login.dart';
import 'package:loginrace/User/usereditprofile.dart';

class Viewprofile extends StatefulWidget {
    final String userId;

  const Viewprofile({Key? key, required this.userId}) : super(key: key);

  @override
  State<Viewprofile> createState() => _ViewprofileState();
}

class _ViewprofileState extends State<Viewprofile> {
 late Future<DocumentSnapshot> userData;

  @override
  void initState() {
    super.initState();
    userData = getUserData();
  }

  Future<DocumentSnapshot> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('user_register')
        .doc(widget.userId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login(type: 'user');
              }));
            },
          ),
        ],
      ),
    body: FutureBuilder<DocumentSnapshot>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;
          var imageUrl = data['image_url'] as String?;

           return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.blue,
                    backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
                    child: imageUrl == null ? Icon(Icons.person, size: 70, color: Colors.white) : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' ${data['name']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(' ${data['email']}', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text(' ${data['mobile_no']}', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text(' ${data['place']}', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      // Text('Proof: ${data['proof']}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}