import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/User/userlogin.dart';

class UserRgistration extends StatefulWidget {
  const UserRgistration({super.key});

  @override
  State<UserRgistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRgistration> {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var place = TextEditingController();
  var pass = TextEditingController();
  var conf = TextEditingController();
  final fkey = GlobalKey<FormState>();
  File? _selectedImage;
  bool imageSelected = false;
  File? _selectedFile;
  bool fileSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: fkey,
              child: Container(
                width: 400,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final picker = ImagePicker();
                          final pickedImage =
                              await picker.getImage(source: ImageSource.gallery);

                          if (pickedImage != null) {
                            setState(() {
                              _selectedImage = File(pickedImage.path);
                              imageSelected = true;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: _selectedImage != null
                              ? FileImage(_selectedImage!)
                              : null,
                          child: imageSelected
                              ? Container()
                              : Icon(Icons.add_a_photo),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter username';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Name',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter phone number';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android_sharp),
                          hintText: 'Phone',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: place,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter location';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.place_outlined),
                          hintText: 'Place',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () async {
                          final picker = ImagePicker();
                          final pickedImage =
                              await picker.getImage(source: ImageSource.gallery);

                          if (pickedImage != null) {
                            String filePath = pickedImage.path;
                            setState(() {
                              _selectedFile = File(filePath);
                              fileSelected = true;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.attach_file),
                              SizedBox(width: 10),
                              Text('Upload File'),
                            ],
                          ),
                        ),
                      ),
                      fileSelected
                          ? Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'File Chosen: ${_selectedFile?.path ?? ""}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {

                          await FirebaseFirestore.instance.collection("userregister").add({
                         'name':name.text,
                         'email':email.text,
                         'phone':phone.text,
                         'place':place.text,
                     });
                          if (fkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return UserLogin();
                              }),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blueAccent,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
