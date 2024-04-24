import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventRegistrationPage extends StatefulWidget {
  String rt_id;
   EventRegistrationPage({super.key, required this. rt_id});

  @override
  State<EventRegistrationPage> createState() => _EventRegistrationPageState();
}

class _EventRegistrationPageState extends State<EventRegistrationPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _licenseNumberController = TextEditingController();
  File? _vehicleImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more complex email validation if needed
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more specific phone number validation if needed
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _licenseNumberController,
                decoration: InputDecoration(labelText: 'License Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your license number';
                  }
                  // Validate license number format (e.g., integer)
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid license number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _vehicleImage != null
                  ? Image.file(
                      _vehicleImage!,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickVehicleImage,
                child: Text('Select Vehicle Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitRegistration,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickVehicleImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _vehicleImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitRegistration() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with registration

      String fullName = _fullNameController.text;
      String email = _emailController.text;
      String phoneNumber = _phoneNumberController.text;
      String address = _addressController.text;
      String licenseNumber = _licenseNumberController.text;

      // Check if the license number already exists
      bool licenseExists = await _licenseNumberAlreadyExists(licenseNumber);

     if (licenseExists) {
  // License number already exists, show toast message
  Fluttertoast.showToast(
    msg: "License number already exists",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
  return;
}
      // Get user ID from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('uid');

      if (userId != null) {
        // User ID exists in SharedPreferences
        String vehicleImageUrl = await _uploadVehicleImage();

        // Store registration details in Firestore
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference registrations = firestore.collection('Event_Registration');

        await registrations.add({
          'userId': userId,
          'event_id': widget.rt_id,
          'fullName': fullName,
          'email': email,
          'phoneNumber': phoneNumber,
          'address': address,
          'licenseNumber': licenseNumber,
          'vehicleImageUrl': vehicleImageUrl,
        });

        // Registration successful
        print('Registration successful');
      } else {
        // User ID does not exist in SharedPreferences
        print('User ID not found in SharedPreferences.');
      }
    }
  }

  Future<bool> _licenseNumberAlreadyExists(String licenseNumber) async {
    // Query Firestore to check if any document has the provided license number
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Event_Registration')
        .where('licenseNumber', isEqualTo: licenseNumber)
        .get();

    // If any document matches the license number, return true, else return false
    return querySnapshot.docs.isNotEmpty;
  }

  Future<String> _uploadVehicleImage() async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = FirebaseStorage.instance.ref().child('vehicle_images/$fileName.jpg');
      await storageReference.putFile(_vehicleImage!);
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading vehicle image: $e');
      throw e;
    }
  }
}