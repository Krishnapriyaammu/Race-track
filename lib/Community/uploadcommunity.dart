import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Community/addcommunitydetails.dart';

class UploadCommunity extends StatefulWidget {
  const UploadCommunity({super.key});

  @override
  State<UploadCommunity> createState() => _UploadCommunityState();
}

class _UploadCommunityState extends State<UploadCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: SingleChildScrollView(
                child: TabBar(
                  tabs: [
                    Tab(
                      text: 'Add Community',
                    ),
                    Tab(
                      text: 'Add Details',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AddCommunityTab(),
                  AddDetailsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCommunityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Community'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCommunityDetailsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Add Community Content Here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class AddDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add Details Content Here',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class AddCommunityDetailsPage extends StatefulWidget {
  @override
  _AddCommunityDetailsPageState createState() =>
      _AddCommunityDetailsPageState();
}

class _AddCommunityDetailsPageState extends State<AddCommunityDetailsPage> {
 var DescriptionEdit = TextEditingController();
  final fkey = GlobalKey<FormState>();
  var profileImage;
  XFile? pickedFile;

  // File? _selectedImage;
  String imageUrl = '';

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Community Details'),
      ),
     body: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('ENTER THE DETAILS:'),
                ],
              ),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: profileImage!= null
                        ? DecorationImage(
                            image: FileImage(profileImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: profileImage== null
                      ? Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.grey[600],
                        )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  maxLines: 5,
                  controller: DescriptionEdit,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Describe here',
                    fillColor: Color.fromARGB(255, 180, 206, 251),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("upload_community")
                      .add({
                    'description': DescriptionEdit.text,
                    'image_url': imageUrl,
                  });
                  if (fkey.currentState!.validate()) {
                    print(DescriptionEdit.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CommunityAbout();
                    }));
                  }
                },
                child: Text('UPLOAD'),
              )
            ],
            ),

              ),
        )
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










              

 