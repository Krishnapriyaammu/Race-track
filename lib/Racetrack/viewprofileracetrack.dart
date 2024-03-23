import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Racetrack/editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaceTrackViewProfile extends StatefulWidget {
 var img;
 var name;
 var email;
 var mobile_no;
 var place;
 var proof;
 
   RaceTrackViewProfile({super.key});

  @override
  State<RaceTrackViewProfile> createState() => _RaceTrackViewProfileState();
}

class _RaceTrackViewProfileState extends State<RaceTrackViewProfile> {
   Future<List<DocumentSnapshot>> getdata() async {
    try {
       SharedPreferences sp = await SharedPreferences.getInstance();
        var a = sp.getString('uid');
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('race_track_register').where('uid', isEqualTo: a)
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
  
  
          title: Text('View Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit_note_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return YourPage();
                  },));
              },
            ),
          ],
        ),
        body: 
              Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 330),
        child: FutureBuilder(
          future: getdata(),
          builder: (context,snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
              children: [
               Container(
                    
                    height: 130,
                    width: 90,
                    child: widget.img != null
                           ? Image.network(widget.img, fit: BoxFit.cover)
                           : Icon(Icons.image),
                  ),
                SizedBox(height: 16),
                Text(
                   widget.name ?? 'name not available',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                   widget.email ?? 'name not available',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                   widget.mobile_no ?? 'name not available',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                   widget.place ?? 'name not available',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                   widget.proof ?? 'name not available',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            );
          }
        ),
      ),


     ),


    );
  }
}