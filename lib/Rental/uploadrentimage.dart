import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginrace/Rental/viewrentproducts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RentUploadImage extends StatefulWidget {
  const RentUploadImage({super.key});

  @override
  State<RentUploadImage> createState() => _RentUploadImageState();
}

class _RentUploadImageState extends State<RentUploadImage> {
   var DescriptionEdit = TextEditingController();
  File? _selectedImage;
  final picker = ImagePicker();
  String? selectedCategory;

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
        title: Text('Add Events'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                hint: Text('Select Category'),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                items: ['Bikes', 'Cars', 'Grocery']
                    .map((category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (selectedCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please select a category.'),
                  ));
                  return;
                }
                if (_selectedImage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please select an image.'),
                  ));
                  return;
                }
                if (DescriptionEdit.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Description is required.'),
                  ));
                  return;
                }

                try {
                  Reference storageReference = FirebaseStorage.instance
                      .ref()
                      .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

                  await storageReference.putFile(_selectedImage!);

                  String imageUrl = await storageReference.getDownloadURL();
                    SharedPreferences sp = await SharedPreferences.getInstance();
                  var uid = sp.getString('uid');
                  await FirebaseFirestore.instance.collection("rentaluploadimage").add({
                    'category': selectedCategory,
                    'description': DescriptionEdit.text,
                    'image_url': imageUrl,
                    'pro_id':uid
                  });

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProductViewPage()));
                } catch (e) {
                  print('Error uploading image: $e');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to upload image. Please try again later.'),
                  ));
                }
              },
              child: Text('UPLOAD'),
            )
          ],
        ),
      ),
    );
  }
}