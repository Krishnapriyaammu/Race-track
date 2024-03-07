import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/User/viewprofile.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({Key? key}) : super(key: key);

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var place = TextEditingController();
  var proof=TextEditingController();
  final _formKey = GlobalKey<FormState>();
    File? _image;
 Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child:  Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      Container(
                        child: _image != null
                            ? CircleAvatar(
                                radius: 50.0,
                                backgroundImage: FileImage(_image!),
                              )
                            : Image.asset('images/imaaaa.jpg'),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 227, 102, 113),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: _pickImage,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 16.0),
                SizedBox(height: 16.0),
                _buildTextField('Name', 'Enter your name', TextInputType.text, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  // return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Email', 'Enter your email', TextInputType.emailAddress, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more advanced email validation logic if needed
                  // return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Phone Number', 'Enter your phone number', TextInputType.phone, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more advanced phone number validation logic if needed
                  // return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('Place', 'Enter your place', TextInputType.text, (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your place';
                  }
                  // return null;
                }),
                SizedBox(height: 16.0),
                _buildTextField('license', 'Enter your proof', TextInputType.text, (value) {
                  if (value!.isEmpty) {
                    return 'Please upload license';
                  }
                  // return null;
                }),
                SizedBox(height: 16.0),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () 
                     async{
                             

                          await FirebaseFirestore.instance.collection("usereditprofile").add({
                         'name':name.text,
                         'email':email.text,
                         'phone':phone.text,
                         'place':place.text,
                         'license':proof.text,
                       
                     });
                      print(name.text);
                              print(email.text);
                              print(phone.text);
                              print(place.text);
                              print(proof.text);
                            
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with submission
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Viewprofile();
                          }),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130)),
                    ),
                    child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String labelText, String hintText, TextInputType inputType, String? Function(String?)? validator) {
    return TextFormField(
      controller: name,
      
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
      keyboardType: inputType,
      validator: validator,
    );
  }
}
