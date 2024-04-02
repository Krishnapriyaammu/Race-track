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

class _InstructorHomePageState extends State<InstructorHomePage> with SingleTickerProviderStateMixin {
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
          .collection('race_track_add_coach').where('uid',isEqualTo: a)
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
   var name=TextEditingController();
  var about=TextEditingController();
  var exp=TextEditingController();
  String imageUrl='';


  CoachTab({Key? key, this.selectedImage}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                itemBuilder: (context, index) {
                  final document = snapshot.data![index];
                        //  final id = snapshot.data![index].id;
                        //  print(id);
                        final data =
                            document.data() as Map<String, dynamic>;
                             final imageUrl = data['image_url'];
                  return ListTile(
                    title: Text(data['name'] ?? 'Name not available'),
                    subtitle: Column(
                      children: [
                        Text(data['about'] ?? 'Name not available'),
                        Text(data['experience']?? 'experience not available'),
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
                                trailing:  IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Handle edit action
                                // You can navigate to the edit page or show a dialog for editing
                              },
                            ),    
                  );
                },
              );
            }
            }
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
                            pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);

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
                      items: experiences.map<DropdownMenuItem<String>>((String value) {
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
                    onPressed: () async{

                        
                  Reference storageReference = FirebaseStorage.instance
                      .ref()
                      .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

                  await storageReference.putFile(profileImage!);

                  String imageUrl = await storageReference.getDownloadURL();
                        await uploadImage();
                        SharedPreferences sp = await SharedPreferences.getInstance();
                     var a = sp.getString('uid');

                       DocumentReference coachRef =  await FirebaseFirestore.instance.collection("race_track_add_coach").add({
                       'name':name.text,
                       'about':about.text,
                       'experience':selectedExperience,
                       'image_url': imageUrl,
                       'uid':a,
                       'coach_id':'',
                   

                      
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

class UserTab extends StatelessWidget {
  Future<List<DocumentSnapshot>> getdetails() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('coachbooking')
          .get();
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ApproveReject();
                    }));
                  },
                  child: ListTile(
                    title: FutureBuilder(
                      future: getUserName(data['userid']),
                      builder: (context, AsyncSnapshot<String> userSnapshot) {
                        if (userSnapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (userSnapshot.hasError) {
                          return Text('Error fetching user name');
                        } else {
                          return Text(userSnapshot.data ?? 'User name not available');
                        }
                      },
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(data['level'] ?? 'level not available'),
                        Text(data['time'] ?? 'time not available'),
                        Text(data['date'] ?? 'date not available'),
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
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Status updated to Approved'),
                                duration: Duration(seconds: 2),
                              ));
                            } catch (e) {
                              // Show error message if update fails
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Failed to update status: $e'),
                                duration: Duration(seconds: 2),
                              ));
                            }
                          },
                          icon: Icon(Icons.check),
                          label: Text('Approve'),
                        ),
                        SizedBox(width: 8), // Add some spacing between the icons
                        ElevatedButton.icon(
                          onPressed: () async {
                            // Add code here to handle rejection
                          },
                          icon: Icon(Icons.close),
                          label: Text('Reject'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
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
 final List<User2> bookedUsers = [
    User2(name: 'John Doe', email: 'john@example.com', phoneNumber: '123-456-7890',age:'23',date:'2-09-2024'),
    User2(name: 'Jane Doe', email: 'jane@example.com', phoneNumber: '987-654-3210',age:'20',date:'2-09-2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookedUsers.length,
      itemBuilder: (context, index) {
        User2 user = bookedUsers[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return ApproveReject();
                                      }));
          },
            child: ListTile(
              title: Text(user.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${user.email}'),
                  Text('Phone: ${user.phoneNumber}'),
                  Text('age: ${user.age}'),
                  Text('date:${user.date}'),
                  // Add more details as needed
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class User2 {
  final String name;
  final String email;
  final String phoneNumber;
  final String age;
  final String date;

  User2({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.date,
  });
}