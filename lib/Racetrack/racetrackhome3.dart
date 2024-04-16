import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/approvereject.dart';
import 'package:loginrace/Racetrack/navigationracetrack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstructorHomePage(),
    );
  }
}

class InstructorHomePage extends StatefulWidget {
  const InstructorHomePage({Key? key}) : super(key: key);

  @override
  State<InstructorHomePage> createState() => _InstructorHomePageState();
}

class _InstructorHomePageState extends State<InstructorHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  File? _selectedImage;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coach Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.person_add), text: 'Add Coaches'),
            Tab(icon: Icon(Icons.people), text: 'View Users'),
            Tab(icon: Icon(Icons.approval_outlined), text: 'Accepted Users'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Add Coaches
          CoachTab(selectedImage: _selectedImage),

          // Tab 2: View Users
          UserTab(),

          // Tab 3: Feedback & Ratings
          AcceptedUser(),
        ],
      ),
    );
  }
}

class CoachTab extends StatelessWidget {
  Future<List<DocumentSnapshot>> getData() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      var a = sp.getString('uid');

      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('race_track_add_coach')
          .where('uid', isEqualTo: a)
          .get();
      print('Fetched ${snapshot.docs.length} documents......');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  var profileImage;
  XFile? pickedFile;
  File? image;
  final File? selectedImage;
  var name = TextEditingController();
  var about = TextEditingController();
  var exp = TextEditingController();
  String imageUrl = '';

  CoachTab({Key? key, this.selectedImage}) : super(key: key);

 void showDeleteConfirmationDialog(BuildContext context, String coachId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this coach?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Delete coach detail from Firestore
                await FirebaseFirestore.instance.collection("race_track_add_coach").doc(coachId).delete();
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  itemBuilder: (context, index) {
                    final document = snapshot.data![index];
                    //  final id = snapshot.data![index].id;
                    //  print(id);
                    final data = document.data() as Map<String, dynamic>;
                    final imageUrl = data['image_url'];
                    return ListTile(
                      title: Text(data['name'] ?? 'Name not available'),
                      subtitle: Column(
                        children: [
                          Text(data['about'] ?? 'Name not available'),
                          Text(
                              data['experience'] ?? 'experience not available'),
                        ],
                      ),
                      leading: imageUrl != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                              radius: 30,
                            )
                          : CircleAvatar(
                              child: Icon(Icons.person),
                              radius: 30,
                            ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditCoachDialog(context, {
                                'docId': document.id,
                                'name': data['name'],
                                'about': data['about'],
                                'experience': data['experience'],
                                'image_url': imageUrl,
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDeleteConfirmationDialog(
                                  context, document.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        // Add Coach Button at the bottom
        ElevatedButton(
          onPressed: () {
            // Open a dialog to add a coach
            _showAddCoachDialog(context);
          },
          child: Text('Add Coach'),
        ),
      ],
    );
  }

  // Function to show the add coach dialog
  void _showAddCoachDialog(BuildContext context) {
    String? selectedExperience;
    List<String> experiences = ['0-2 years', '2-5 years', '5+ years'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('Add Coach'),
                content: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);

                        setState(() {
                          if (pickedFile != null) {
                            profileImage = File(pickedFile!.path);
                          }
                        });
                      },
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profileImage != null
                              ? FileImage(profileImage)
                              : null,
                          child: profileImage == null
                              ? Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                )
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    SizedBox(height: 16),
                    DropdownButton<String>(
                      value: selectedExperience,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedExperience = newValue;
                        });
                      },
                      items: experiences
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Select Experience'),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: about,
                      decoration: InputDecoration(
                        hintText: 'About the Coach',
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
                    onPressed: () async {
                      Reference storageReference = FirebaseStorage.instance
                          .ref()
                          .child(
                              'images/${DateTime.now().millisecondsSinceEpoch}.jpg');

                      await storageReference.putFile(profileImage!);

                      String imageUrl = await storageReference.getDownloadURL();
                      await uploadImage();
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      var a = sp.getString('uid');

                      DocumentReference coachRef = await FirebaseFirestore
                          .instance
                          .collection("race_track_add_coach")
                          .add({
                        'name': name.text,
                        'about': about.text,
                        'experience': selectedExperience,
                        'image_url': imageUrl,
                        'uid': a,
                        'coach_id': '',
                      });
                      String coachId = coachRef.id;
                      await coachRef.update({'coach_id': coachId});

                      print('Add Coach');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return InstructorHomePage();
                        }),
                      );

                      // Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> uploadImage() async {
    try {
      if (profileImage != null) {
        Reference storageReference =
            FirebaseStorage.instance.ref().child('image/${pickedFile!.name}');

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

class UserTab extends StatelessWidget {

  Future<List<DocumentSnapshot>> getdetails() async {
    try {
       SharedPreferences sp = await SharedPreferences.getInstance();
      var uid = sp.getString('uid');
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('coachbooking').where('rt_id', isEqualTo: uid).

          get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  Future<String> getUserName(String userId) async {
    try {
      final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('user_register')
          .doc(userId)
          .get();
      final userData = userSnapshot.data() as Map<String, dynamic>;
      return userData['name'];
    } catch (e) {
      print('Error fetching user data: $e');
      return ''; // Return empty string if user data retrieval fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdetails(),
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

              return Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ApproveReject();
                    }));
                  },
                  child: ListTile(
                    title: FutureBuilder(
                      future: getUserName(data['userid']),
                      builder: (context, AsyncSnapshot<String> userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (userSnapshot.hasError) {
                          return Text('Error fetching user name');
                        } else {
                          return Text(
                              userSnapshot.data ?? 'User name not available');
                        }
                      },
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['level'] ?? 'level not available'),
                        Text(data['time'] ?? 'time not available'),
                        Text(data['date'] ?? 'date not available'),
                         if (data['status'] == 1) Text('Status: Approved'),

                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            try {
                              // Update status in Firebase
                              await FirebaseFirestore.instance
                                  .collection('coachbooking')
                                  .doc(document.id)
                                  .update({'status': 1});

                              // Show confirmation message
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Status updated to Approved'),
                                duration: Duration(seconds: 2),
                              ));
                            } catch (e) {
                              // Show error message if update fails
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Failed to update status: $e'),
                                duration: Duration(seconds: 2),
                              ));
                            }
                          },
                          icon: Icon(Icons.check),
                          label: Text('Approve'),
                        ),
                        SizedBox(
                            width: 8), // Add some spacing between the icons
                        ElevatedButton.icon(
                           onPressed: data['status'] == 1
                            ? null
                            : () async {
                                // Add code here to handle rejection
                              },
                        icon: Icon(Icons.close),
                        label: Text('Reject'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: data['status'] == 1
                              ? Colors.grey // Change color to grey if status is 1
                              : Colors.red,
                        ),
                      ),
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

class AcceptedUser extends StatelessWidget {

    Future<List<Map<String, dynamic>>> getAcceptedDetails() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      var uid = sp.getString('uid');
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('coachbooking')
          .where('status', isEqualTo: 1) .where('rt_id', isEqualTo: uid)

          .get();
      print('Fetched ${snapshot.docs.length} accepted documents');

      List<Map<String, dynamic>> acceptedDetails = [];

      for (DocumentSnapshot document in snapshot.docs) {
        final data = document.data() as Map<String, dynamic>;
        final userId = data['userid'];
        
        // Fetch user details based on userid
        final userSnapshot = await FirebaseFirestore.instance
          .collection('user_register')
          .doc(userId)
          .get();

        final userData = userSnapshot.data() as Map<String, dynamic>;
        final userName = userData['name'];

        // Add booking details along with user name to the list
        acceptedDetails.add({
          'name': userName,
          'date': data['date'] ?? 'Not available',
          'level': data['level'] ?? 'Not available',
          'time': data['time'] ?? 'Not available',
          // Add more details as needed
        });
      }

      return acceptedDetails;
    } catch (e) {
      print('Error fetching accepted data: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAcceptedDetails(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final details = snapshot.data![index];

              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('User: ${details['name'] ?? 'Not available'}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${details['date']}'),
                      Text('Level: ${details['level']}'),
                      Text('Time: ${details['time']}'),
                      // Add more details as needed
                    ],
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
void _showEditCoachDialog(
    BuildContext context, Map<String, dynamic> coachData) {
  String? selectedExperience;
  List<String> experiences = ['0-2 years', '2-5 years', '5+ years'];

  // Set initial values for the fields
  TextEditingController name = TextEditingController(text: coachData['name']);
  TextEditingController about = TextEditingController(text: coachData['about']);
  selectedExperience = coachData['experience'];

  XFile? pickedFile;
  File? profileImage;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Edit Coach'),
              content: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      ImagePicker picker = ImagePicker();
                      pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      setState(() {
                        if (pickedFile != null) {
                          profileImage = File(pickedFile!.path);
                        }
                      });
                    },
                    child: ClipOval(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: profileImage != null
                            ? FileImage(profileImage!)
                            : null,
                        child: profileImage == null
                            ? Icon(Icons.camera_alt, size: 30)
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButton<String>(
                    value: selectedExperience,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedExperience = newValue;
                      });
                    },
                    items: experiences
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text('Select Experience'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: about,
                    decoration: InputDecoration(
                      hintText: 'About the Coach',
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
                  onPressed: () async {
                    if (profileImage != null) {
                      Reference storageReference = FirebaseStorage.instance
                          .ref()
                          .child(
                              'images/${DateTime.now().millisecondsSinceEpoch}.jpg');

                      await storageReference.putFile(profileImage!);

                      String imageUrl = await storageReference.getDownloadURL();
                      coachData['image_url'] = imageUrl;
                    }

                    coachData['name'] = name.text;
                    coachData['about'] = about.text;
                    coachData['experience'] = selectedExperience;

                    // Update coach data in Firestore
                    await FirebaseFirestore.instance
                        .collection("race_track_add_coach")
                        .doc(coachData['docId'])
                        .update(coachData);

                    print('Edit Coach');
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
