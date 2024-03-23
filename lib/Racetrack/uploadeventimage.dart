import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:loginrace/Racetrack/navigationracetrack.dart';
import 'package:loginrace/Racetrack/racetrackhome1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaceTrackUploadEventimage extends StatefulWidget {
  const RaceTrackUploadEventimage({super.key});

  @override
  State<RaceTrackUploadEventimage> createState() => _RaceTrackUploadEventimageState();
}

class _RaceTrackUploadEventimageState extends State<RaceTrackUploadEventimage> {
    TextEditingController evname = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController eventowner = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? pickedFile;
  File? _selectedImage;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadImage() async {

     SharedPreferences sp = await SharedPreferences.getInstance();
     var a = sp.getString('uid');
    try {
      if (_selectedImage != null) {
        final Reference storageReference = FirebaseStorage.instance.ref().child('image/${DateTime.now()}.jpg');

        await storageReference.putFile(_selectedImage!);
        final String imageUrl = await storageReference.getDownloadURL();

        // After uploading image, save event details along with imageUrl to Firestore
        await FirebaseFirestore.instance.collection("racetrack_upload_event").add({
          'event name': evname.text,
          'date': date.text,
          'time': time.text,
          'place': place.text,
          'eventowner': eventowner.text,
          'image_url': imageUrl,
          'uid':a,
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RaceTrackNavigation()),
        );
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add events'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: evname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Event name',
                    fillColor: Color.fromARGB(255, 180, 206, 251),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: date,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Event date',
                    fillColor: Color.fromARGB(255, 180, 206, 251),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: time,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Event time',
                    fillColor: Color.fromARGB(255, 180, 206, 251),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: place,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Place',
                    fillColor: Color.fromARGB(255, 180, 206, 251),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: eventowner,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Owner',
                    fillColor: Color.fromARGB(255, 180, 206, 251),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await uploadImage();
                  }
                },
                child: Text('UPLOAD'),
              )
            ],
          ),
        ),
      ),
    );
  }
}