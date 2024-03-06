import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/viewprofileracetrack.dart';

class YourPage extends StatefulWidget {
  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
  final _formKey = GlobalKey<FormState>();

  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var place = TextEditingController();
  var proof = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: _pickImage,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 102, 113),
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
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: place,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: proof,
                  decoration: InputDecoration(
                    labelText: 'Proof',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your proof';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(name.text);
                      print(email.text);
                      print(phone.text);
                      print(place.text);
                      print(proof.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RaceTrackViewProfile();
                        }),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
