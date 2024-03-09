import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:loginrace/Racetrack/navigationracetrack.dart';
import 'package:loginrace/Racetrack/vieweventsracetrack.dart';

class RaceTrackUploadEventimage extends StatefulWidget {
  const RaceTrackUploadEventimage({super.key});

  @override
  State<RaceTrackUploadEventimage> createState() => _RaceTrackUploadEventimageState();
}

class _RaceTrackUploadEventimageState extends State<RaceTrackUploadEventimage> {
     var DescriptionEdit = TextEditingController();
  final fkey = GlobalKey<FormState>();
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
        title: Text('Add events'),
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
                onPressed: () {
                  if (fkey.currentState!.validate()) {
                    print(DescriptionEdit.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RaceTrackNavigation();
                    }));
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