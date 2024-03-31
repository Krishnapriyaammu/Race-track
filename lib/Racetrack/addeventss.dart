import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/racetrackhome1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventAdd extends StatefulWidget {
  const EventAdd({super.key});

  @override
  State<EventAdd> createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {

 String _generalPrice = ''; // State for general ticket price
  String _childPrice = ''; // 
 File? _image; 
   String imageUrl='';
   
// Variable to store selected image

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveTicketDetails() async {

 SharedPreferences sp = await SharedPreferences.getInstance();
    var a = sp.getString('uid');

                await uploadImage();
    try {
      final CollectionReference tickets =
          FirebaseFirestore.instance.collection('racetrack_upload_event');
      await tickets.add({
        'event_name': _eventNameController.text,
        'event_date': _eventDateController.text,
        'total_tickets': _totalTicketsController.text,
        'general_price': _generalPrice,
          'image_url':imageUrl,
        'child_price': _childPrice,
        'rt_id':a,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ticket details saved successfully.'),
        duration: Duration(seconds: 2),
      ));
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return RaceTrackViewEvents();

                    }));



    } catch (e) {
      print('Error saving ticket details: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error saving ticket details.'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _totalTicketsController =
      TextEditingController();

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDateController.dispose();
    _totalTicketsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              // Image display
              _image != null
                  ? Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: Icon(Icons.image, size: 100, color: Colors.grey),
                    ),
              SizedBox(height: 10),
              // Button to pick image
              TextButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _eventNameController,
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _eventDateController,
                decoration: InputDecoration(
                  labelText: 'Event Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _totalTicketsController,
                decoration: InputDecoration(
                  labelText: 'Total tickets',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'General category',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _generalPrice = value;
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Price (\$)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Child category',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _childPrice = value;
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Price (\$)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveTicketDetails,
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),

                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
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
    if (_image != null) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('image/${_image!.path.split('/').last}');

      await storageReference.putFile(_image!);

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