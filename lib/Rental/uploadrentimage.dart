import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Rental/viewrentproducts.dart';

class RentUploadImage extends StatefulWidget {
  const RentUploadImage({super.key});

  @override
  State<RentUploadImage> createState() => _RentUploadImageState();
}

class _RentUploadImageState extends State<RentUploadImage> {
  File? _pickedImage;
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GALLERY',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: _pickImage,
                        child: _pickedImage != null
                            ? Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: FileImage(_pickedImage!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(112, 243, 214, 214),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.add_a_photo, size: 50),
                              ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Handle submit action
                          // You can access description using _descriptionController.text
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ProductViewPage();
                            }),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 218, 209, 210)),
                        ),
                        child: Text('SUBMIT', style: TextStyle(color: Colors.black)),
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
