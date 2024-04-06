import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginrace/Community/addimagesautoshow.dart';
import 'package:loginrace/Community/viewautoshows.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAutoshows extends StatefulWidget {
  String community_id;
   AddAutoshows({super.key, required this.community_id});

  @override
  State<AddAutoshows> createState() => _AddAutoshowsState();
}

class _AddAutoshowsState extends State<AddAutoshows> {
   TextEditingController _priceController = TextEditingController(); // Controller for price input

  String? _selectedCategory; // Change to nullable
  Map<String, String> _categoryPrices = {
    'Vintage Car': '', // Initialize with empty strings for each category
    'Motor Bikes': '',
    'Sports Car': '',
    'Luxury Car': '',
    // Add more categories as needed
  };
  List<File>? _uploadedImages; // List to store uploaded images

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categoryPrices.keys.first; // Set initial value to the first category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Auto Show',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Vehicle Category:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categoryPrices.keys.map((category) {
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () async {
                  final List<File>? images = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddImageAutoshow(
                        category: _selectedCategory!,
                                  price: _priceController.text, // Pass the price

                      ),
                    ),
                  );
                  if (images != null) {
                    setState(() {
                      _uploadedImages = images;
                    });
                  }
                },
                icon: Icon(Icons.add_photo_alternate),
                label: Text('Add Images'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              _uploadedImages != null && _uploadedImages!.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: _uploadedImages!.map((image) {
                        return GridTile(
                          child: Image.file(image, fit: BoxFit.cover),
                        );
                      }).toList(),
                    )
                  : _selectedCategory != null
                      ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('community_add_autoshows')
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
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                                childAspectRatio: 1.0,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                final Map<String, dynamic> data =
                                    documents[index].data()!;
                                final imageUrl =
                                    data['image_url'] as String?;
                                return GridTile(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: imageUrl != null
                                            ? Image.network(imageUrl,
                                                fit: BoxFit.cover)
                                            : Container(),
                                      ),
                                      SizedBox(height: 8.0),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : Container(),
              SizedBox(height: 250.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: 'Auto Show saved successfully',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                      );
                    },
                    child: Text(
                      'Save Auto Show',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAutoshow(community_id:widget.community_id
                         // Pass the pricec

                      ),
                    ),
                  );                    },
                    child: Text(
                      'View',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 