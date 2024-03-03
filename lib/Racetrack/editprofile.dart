import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/viewprofileracetrack.dart';

class YourPage extends StatefulWidget {
  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
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
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Container(
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
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
                            SizedBox(height: 16.0),

               TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
                            SizedBox(height: 16.0),

               TextField(
                decoration: InputDecoration(
                  labelText: 'location',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
                            SizedBox(height: 16.0),

               TextField(
                decoration: InputDecoration(
                  labelText: 'phone number',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
                            SizedBox(height: 16.0),

               TextField(
                decoration: InputDecoration(
                  labelText: 'proof',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),


              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RaceTrackViewProfile();
                  }));
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
    );
  }
}
