import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Community/addimagesautoshow.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAutoshows extends StatefulWidget {
  const AddAutoshows({super.key});

  @override
  State<AddAutoshows> createState() => _AddAutoshowsState();
}

class _AddAutoshowsState extends State<AddAutoshows> {
 String? _selectedCategory; // Change to nullable
  List<String> _categories = [
    'Vintage Car',
    'Motor Bikes',
    'Sports Car',
    'Luxury Car',
    // Add more categories as needed
  ];
  List<File>? _uploadedImages; // List to store uploaded images
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategory =
        _categories.isNotEmpty ? _categories.first : null; // Set initial value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Auto Show'),
        backgroundColor: Colors.blue, // Unique color
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Vehicle Category:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Category',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Enter Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () async {
                final List<File>? images = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddImageAutoshow(category: _selectedCategory!),
                  ),
                );
                if (images != null) {
                  setState(() {
                    _uploadedImages = images;
                  });
                  // Save uploaded images along with the selected category and price
                  await saveImagesToFirestore(images!);
                }
              },
              icon: Icon(Icons.add_photo_alternate),
              label: Text('Add Images'),
            ),
            SizedBox(height: 20.0),
            _uploadedImages != null && _uploadedImages!.isNotEmpty
                ? Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: _uploadedImages!.map((image) {
                  return GridTile(
                    child: Image.file(image, fit: BoxFit.cover),
                  );
                }).toList(),
              ),
            )
                : Expanded(
              child: _selectedCategory != null
                  ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('community_add_autoshow')
                    .where('category', isEqualTo: _selectedCategory)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<DocumentSnapshot<Map<String, dynamic>>>
                  documents = snapshot.data!.docs;
                  return GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> data =
                      documents[index].data()!;
                      final imageUrl = data['image_url'] as String?;
                      return GridTile(
                        child: imageUrl != null
                            ? Image.network(imageUrl, fit: BoxFit.cover)
                            : Container(),
                      );
                    },
                  );
                },
              )
                  : Container(),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
              },
              child: Text('Save Auto Show'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to save uploaded images along with the selected category and price in Firestore
  Future<void> saveImagesToFirestore(List<File> images) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var uid = sp.getString('uid');
    var price = _priceController.text.trim(); // Get the price entered by the user

    for (var imageFile in images) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageReference.putFile(imageFile);
      String imageUrl = await storageReference.getDownloadURL();
      await FirebaseFirestore.instance.collection("community_add_autoshow").add({
        'image_url': imageUrl,
        'category': _selectedCategory,
        'price': price, // Include the price in the document
        'uid': uid,
      });
    }
  }
}