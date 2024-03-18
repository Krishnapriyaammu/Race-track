import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/navigationracetrack.dart';
import 'package:loginrace/Racetrack/track.dart';
import 'package:loginrace/Racetrack/trackdetails.dart';

class RaceTrackViewRace extends StatefulWidget {
  const RaceTrackViewRace({super.key});

  @override
  State<RaceTrackViewRace> createState() => _RaceTrackViewRaceState();
}

class _RaceTrackViewRaceState extends State<RaceTrackViewRace> {
  var _descriptionController=TextEditingController();
  File? _selectedImage;
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
          //       Expanded(
          //         child: FutureBuilder(
          //           future: getData(),
          //           builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // } else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // } else {
          //   return ListView.builder(
          //               itemCount: snapshot.data?.length ?? 0,
          //               itemBuilder: ((context, index) {
          //                  final document = snapshot.data![index];
          //                  final data = document.data() as Map<String, dynamic>;
          //                  final imageUrl = data['image_url'];
          //                 return Padding(
          //                   padding: const EdgeInsets.all(16.0),
          //                   child: Card(
          //                     elevation: 5,
          //                     child: Row(
          //                       children: [
          //                         // Left Container
          //                         Expanded(
          //                           child: Container(
          //                             padding: EdgeInsets.all(12),
          //                             child: Column(
          //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                               children: [
          //                                 InkWell(
          //                                   onTap: () {},
          //                                   child: Text(
          //                                     data['Renter Name'] ?? 'Name not available',
          //                                     style: TextStyle(
          //                                       fontSize: 18,
          //                                       fontWeight: FontWeight.bold,
          //                                     ),
          //                                   ),
          //                                 ),
          //                                 SizedBox(
          //                                   height: 10,
          //                                 ),
          //                                 Row(
          //                                   children: [
          //                                     RatingBar.builder(
          //                                       itemSize: 20,
          //                                       initialRating: 3,
          //                                       minRating: 1,
          //                                       direction: Axis.horizontal,
          //                                       allowHalfRating: true,
          //                                       itemCount: 5,
          //                                       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          //                                       itemBuilder: (context, _) => Icon(
          //                                         Icons.star,
          //                                         size: 20,
          //                                         color: Colors.amber,
          //                                       ),
          //                                       onRatingUpdate: (rating) {
          //                                         print(rating);
          //                                       },
          //                                     ),
          //                                     SizedBox(width: 10),
          //                                     Text(
          //                                       '3.0',
          //                                       style: TextStyle(
          //                                         fontSize: 16,
          //                                         fontWeight: FontWeight.bold,
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                                 SizedBox(height: 10),
          //                                 Text(
          //                                   'Car Racing Track',
          //                                   style: TextStyle(
          //                                     fontSize: 16,
          //                                   ),
          //                                 ),
          //                                 Text(
          //                                   'Coimbatore, Tamilnadu',
          //                                   style: TextStyle(
          //                                     fontSize: 14,
          //                                     color: Colors.grey,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
                      
          //                         // Right Container
          //                         Container(
          //                           width: 120,
          //                           height: 120,
          //                           decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(8),
          //                             image: DecorationImage(
          //                               image: AssetImage('images/racing.jpg'),
          //                               fit: BoxFit.cover,
          //                             ),
          //                           ),
          //                            child: imageUrl != null
          //                           ? Image.network(imageUrl, fit: BoxFit.cover)
          //                          : Icon(Icons.image),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 );
          //               }),
          //             );
          //           }
          //         ),
          //       ),
              ],
            ),

            // View Booked Users Tab
            ViewBookedUsers(), 
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
            return AlertDialog(
              title: Text('Add Track'),
              content: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

                      setState(() {
                        if (pickedFile != null) {
                          _selectedImage = File(pickedFile.path);
                        }
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: _selectedImage != null
                            ? DecorationImage(
                                image: FileImage(_selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _selectedImage == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.grey[600],
                            )
                          : null,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Add Description',
                    ),
                  ),
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
                  onPressed: ()  async{
                     await FirebaseFirestore.instance.collection("racetrackuploadtrack").add({
                       'email':_descriptionController.text,
                      
                                         });
                    Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return RaceTrackNavigation();
                              }),
                            );
                    // Navigator.of(context).pop();
                  },
                  child: Text('Upload'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
class ViewBookedUsers extends StatelessWidget {
  // final List<User> bookedUsers = [
  //   User(name: 'John Doe', email: 'john@example.com', phoneNumber: '123-456-7890'),
  //   User(name: 'Jane Doe', email: 'jane@example.com', phoneNumber: '987-654-3210'),
  //   // Add more users as needed
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        // User user = bookedUsers[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            // title: Text(user.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Email: ${user.email}'),
                // Text('Phone: ${user.phoneNumber}'),
                // Add more details as needed
              ],
            ),
          ),
        );
      },
    );
  }
}

class User {
  final String name;
  final String email;
  final String phoneNumber;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}