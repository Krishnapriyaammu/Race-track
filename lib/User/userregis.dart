import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Common/Login.dart';
import 'package:loginrace/User/navigationuser.dart';

class UserRgistration extends StatefulWidget {
  const UserRgistration({super.key});

  @override
  State<UserRgistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRgistration> {
  

  
   var profileImage;
  XFile? pickedFile;
  File? image;
  var Name = TextEditingController();
  var Email = TextEditingController();
  var Place = TextEditingController();
  var password = TextEditingController();
  var confirmPass = TextEditingController();
    var Mobile = TextEditingController();
  final fkey = GlobalKey<FormState>();
String imageUrl='';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Register')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(key: fkey,
                child: Container(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Name'),
                            ),
                          ],
                        ),
                        TextFormField(controller: Name,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Email'),
                            ),
                          ],
                        ),
                        TextFormField(controller: Email,
                         validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter email';
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
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Place'),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: Place,
                           validator: (value) {
                            if (value!.isEmpty) {
                              return 'field is empty';
                            }
                          },
                          // keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 192, 221, 224),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide.none)),
                        ),
                       
                      
                      
                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Mobile Number'),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: Mobile,
                           validator: (value) {
                            if (value!.isEmpty) {
                              return 'field is empty';
                            }
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 192, 221, 224),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide.none)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Password'),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: password,
                           validator: (value) {
                            if (value!.isEmpty) {
                              return 'field is empty';
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 192, 221, 224),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide.none)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('confirm password'),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: confirmPass,
                           validator: (value) {
                            if (value!.isEmpty) {
                              return 'field is empty';
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 192, 221, 224),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide.none)),
                        ),
                
                      
                
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          
                          
                          onPressed: () async {
                            await uploadImage();
                            
                            await FirebaseFirestore.instance
                                .collection('user_register')
                                .add({
                              'name': Name.text,
                              'email': Email.text,
                              'place':Place.text,
                              
                              'mobile_no': Mobile.text,
                              'password': password.text,
                              'conform password': confirmPass.text,
                             
                              'image_url': imageUrl,
                            });
                            print(Name.text);
                              print(Email.text);
                             
                              print(Mobile.text);
                              print(password.text);
                              print(confirmPass.text);
                               if (fkey.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NavigationUser();
                                
                            }));
                               }
                          },
                          child: Text('register'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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