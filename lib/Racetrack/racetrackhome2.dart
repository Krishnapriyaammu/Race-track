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
  var Racetrackname=TextEditingController();
  var Rating=TextEditingController();
  var tracktype=TextEditingController();
  var Place=TextEditingController();
  var upcoming_events=TextEditingController();
  var level1=TextEditingController();
  var level2=TextEditingController();
  String imageUrl='';
  var profileImage;
  XFile? pickedFile;
  File? image;



    Future<List<DocumentSnapshot>> getData() async {
    try {
       SharedPreferences sp = await SharedPreferences.getInstance();
                     var a = sp.getString('uid');
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('racetrack_upload_track').where('uid',isEqualTo: a)
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
                    builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
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
                                                  
                                  // Right Container
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
                    }
                  ),
                ),
              ],
            ),

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
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Rating'),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: Rating,
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
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Track type'),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: tracktype,
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
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('place'),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: Place,
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
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('events'),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: upcoming_events,
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
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('amount level1'),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: level1,
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
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('amount level 2'),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: level2,
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
                         
                         
                         
                         
                          SizedBox(
                            height: 20,
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
                      SharedPreferences sp = await SharedPreferences.getInstance();
                     var a = sp.getString('uid');
                                      await uploadImage();

                       await FirebaseFirestore.instance.collection("racetrack_upload_track").add({
                         'track name':Racetrackname.text,
                         'rating':Rating.text,
                         'tracktype':tracktype.text,
                         'place':Place.text,
                         'upcomingevents':upcoming_events.text,
                         'level1':level1.text,
                         'level2':level2.text,
                          'image_url': imageUrl,
                          'uid':a,

                        
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
        Reference storageReference =
        FirebaseStorage.instance
            .ref()
            .child('image/${pickedFile!.name}');

        await storageReference.putFile(profileImage!);

        // Get the download URL
        imageUrl = await storageReference.getDownloadURL();

        // Now you can use imageUrl as needed (e.g., save it to Firestore)
        print('Image URL: $imageUrl');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }                                
  }
}


class ViewBookedUsers extends StatefulWidget {
  ViewBookedUsers({Key? key, }) : super(key: key);

  @override
  _ViewBookedUsersState createState() => _ViewBookedUsersState();
}

class _ViewBookedUsersState extends State<ViewBookedUsers> {
  List<DocumentSnapshot> selectedItems = [];
  String selectedLevel = 'Level 1';

  Future<List<DocumentSnapshot>> getDetail() async {
    try {
        SharedPreferences sp = await SharedPreferences.getInstance();
                     var a = sp.getString('uid');
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user_track_booking') .where('uid',isEqualTo: a) 
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  void updateStatus() {
    setState(() {
      selectedItems.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDetail(),
      builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final document = snapshot.data![index];
              final data = document.data() as Map<String, dynamic>;
              final isSelected = selectedItems.contains(document);

             return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return AlertDialog(
                            title: Text('Selected User Level'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Name: ${data['name'] ?? 'Name not available'}'),
                                Text('Email: ${data['email'] ?? 'Email not available'}'),
                                Text('Place: ${data['place'] ?? 'Place not available'}'),
                                Text('Phone: ${data['phone'] ?? 'Phone not available'}'),
                                SizedBox(height: 20),
                                Text('Select Level:'),
                                DropdownButton<String>(
                                  value: selectedLevel,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedLevel = newValue!;
                                    });
                                  },
                                  items: <String>['Level 1', 'Level 2']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  print('Selected Level: $selectedLevel');
                                    updateStatus(); 

                                  Navigator.of(context).pop();
                                },
                                child: Text('Completed'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data['name'] ?? 'Name not available'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['email'] ?? 'Email not available'),
                        Text(data['place'] ?? 'Place not available'),
                        Text(data['phone'] ?? 'Phone not available'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isSelected)
                          ElevatedButton(
                            onPressed: () {


                            },
                            child: Text('Pending'),
                          ),
                        if (isSelected) Icon(Icons.check),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}