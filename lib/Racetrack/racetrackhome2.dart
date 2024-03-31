import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/navigationracetrack.dart';
import 'package:loginrace/Racetrack/track.dart';
import 'package:loginrace/Racetrack/trackamount.dart';
import 'package:loginrace/Racetrack/trackdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaceTrackViewRace extends StatefulWidget {
    

   RaceTrackViewRace({ super.key});

  @override
  State<RaceTrackViewRace> createState() => _RaceTrackViewRaceState();
}

class _RaceTrackViewRaceState extends State<RaceTrackViewRace> {
  var Racetrackname = TextEditingController();
  var Rating = TextEditingController();
  var tracktype = TextEditingController();
  var Place = TextEditingController();
  var upcoming_events = TextEditingController();
  var level1 = TextEditingController();
  var level2 = TextEditingController();
  String imageUrl = '';
  var profileImage;
  XFile? pickedFile;
  File? image;

void updateStatus(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_track_booking')
          .doc(documentId)
          .update({'status': '2'});
      print('Status updated successfully');
    } catch (e) {
      print('Error updating status: $e');
    }
  }

  Future<List<DocumentSnapshot>> getData() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      var a = sp.getString('uid');
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('racetrack_upload_track')
          .where('uid', isEqualTo: a)
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  Future<List<DocumentSnapshot>> getBookedUsers() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      var uid = sp.getString('uid');
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user_track_booking')
          .where('rt_id', isEqualTo: uid)
          .get();
      print('Fetched ${snapshot.docs.length} booked users');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching booked users: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Explore Racetracks'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Add Track'),
              Tab(text: 'View Booked Users'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Add Track Tab
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 238, 180, 180).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for racetracks',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: ((context, index) {
                            final document = snapshot.data![index];
                            final data = document.data() as Map<String, dynamic>;
                            final imageUrl = data['image_url'];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                elevation: 5,
                                child: Row(
                                  children: [
                                    // Left Container
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['track name'] ?? 'Name not available',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 20,
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    size: 20,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  '3.0',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              data['tracktype'] ?? 'Name not available',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              data['place'] ?? 'Name not available',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: AssetImage('images/racing.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: imageUrl != null
                                          ? Image.network(imageUrl, fit: BoxFit.cover)
                                          : Icon(Icons.image),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),

            // View Booked Users Tab



        FutureBuilder(
  future: getBookedUsers(),
  builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else {
      List<DocumentSnapshot> bookedUsers = snapshot.data ?? [];
      return ListView.builder(
        itemCount: bookedUsers.length,
        itemBuilder: (context, index) {
          final userData = bookedUsers[index].data() as Map<String, dynamic>;
          String status = userData['status'] ?? 0; // Default to 0 if status is null
          bool isLevel1Completed = status == 1;
                      final String documentId = bookedUsers[index].id;

          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(userData['name'] ?? 'Name not available'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userData['email'] ?? 'Email not available'),
                  Text(userData['place'] ?? 'Place not available'),
                  Text(userData['phone'] ?? 'Phone not available'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: isLevel1Completed
                    ? null // Disable the button if level 1 is completed
                    : () {
                        // Add functionality for the button
                        // For example, show a dialog with options to approve or reject the booking
                      showDialog(
            context: context,
            builder: (BuildContext context) {
              int selectedLevel = 1; // Default selected level

              return StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return AlertDialog(
                    title: Text('Level Confirmation'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Please choose the level:'),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: selectedLevel,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedLevel = value!;
                                });
                              },
                            ),
                            Text('Level 1'),
                            Radio(
                              value: 2,
                              groupValue: selectedLevel,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedLevel = value!;
                                });
                              },
                            ),
                            Text('Level 2'),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                       
                                    updateStatus(documentId);

                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Complete'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
                      
                child:   status=='0'?Text('Pending'):Text('Level 1 completed'),

              ),
              onTap: () {
                // Add functionality to view more details about the booked user
                // For example, navigate to a detailed profile screen
              },
            ),
          );
        },
      );
    }
  },
),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTrackDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddTrackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return SingleChildScrollView(
              child: AlertDialog(
                title: Text('Add Track'),
                content: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        pickedFile = await picker.pickImage(source: ImageSource.gallery);

                        setState(() {
                          if (pickedFile != null) {
                            profileImage = File(pickedFile!.path);
                          }
                        });
                      },
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profileImage != null ? FileImage(profileImage) : null,
                          child: profileImage == null ? Icon(Icons.camera_alt, size: 30) : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Name'),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: Racetrackname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter Name';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 192, 221, 224),
                        filled: true,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    // Add more form fields as needed...
                    SizedBox(height: 20),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences sp = await SharedPreferences.getInstance();
                      var a = sp.getString('uid');
                      await uploadImage();

                      await FirebaseFirestore.instance.collection("racetrack_upload_track").add({
                        'track name': Racetrackname.text,
                        'rating': Rating.text,
                        'tracktype': tracktype.text,
                        'place': Place.text,
                        'upcomingevents': upcoming_events.text,
                        'level1': level1.text,
                        'level2': level2.text,
                        'image_url': imageUrl,
                        'uid': a,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RaceTrackNavigation();
                        }),
                      );
                    },
                    child: Text('Upload'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> uploadImage() async {
    try {
      if (profileImage != null) {
        Reference storageReference = FirebaseStorage.instance.ref().child('image/${pickedFile!.name}');
        await storageReference.putFile(profileImage!);
        imageUrl = await storageReference.getDownloadURL();
        print('Image URL: $imageUrl');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}