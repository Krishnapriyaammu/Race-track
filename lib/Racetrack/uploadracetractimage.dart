import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Racetrack/viewsingleracetrack.dart';

class UploadRaceTrackImage extends StatefulWidget {
  const UploadRaceTrackImage({super.key});

  @override
  State<UploadRaceTrackImage> createState() => _UploadRaceTrackImageState();
}

class _UploadRaceTrackImageState extends State<UploadRaceTrackImage> {
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
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _pickImage,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RaceTrackViewPage();
                  },));
                if (_selectedImage != null) {
                  print('Image uploaded successfully!');
                } else {
                  print('No image selected.');
                }
              },
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),





    );
  }
}