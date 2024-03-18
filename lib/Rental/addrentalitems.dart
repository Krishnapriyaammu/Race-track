import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RentalServicePage extends StatefulWidget {
  @override
  _RentalServicePageState createState() => _RentalServicePageState();
}



class _RentalServicePageState extends State<RentalServicePage> {

    Future<List<DocumentSnapshot>> getData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('rental_add_service')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }
  TextEditingController _nameController = TextEditingController();
  TextEditingController _serviceController = TextEditingController();
  String imageUrl='';
  var profileImage;
  XFile? pickedFile;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Rental Service Products'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final document = snapshot.data![index];
                final data = document.data() as Map<String, dynamic>;
                final imageUrl = data['image_url'];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 225, 255),
                        // image: DecorationImage(
                        //   image: AssetImage(product.imagePath),
                        //   fit: BoxFit.cover,
                        // ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: imageUrl != null
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : Icon(Icons.image),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          data['Renter Name'] ?? 'Name not available',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          data['Rental Service'] ?? 'Service not available',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Handle delete action
                                // You can show a confirmation dialog and delete the product
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Handle edit action
                                // You can navigate to the edit page or show a dialog for editing
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDetailsDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showAddDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Rental Service'),
          content: _buildAddContainer(context),
        );
      },
    );
  }

  Widget _buildAddContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () async {
                ImagePicker picker = ImagePicker();
                pickedFile = await picker.pickImage(source: ImageSource.gallery);

                setState(() {
                  if (pickedFile != null) {
                    profileImage = File(pickedFile!.path);
                  }
                });
              },
              child: ClipOval(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profileImage != null ? FileImage(profileImage) : null,
                  child: profileImage == null ? Icon(Icons.camera_alt, size: 30) : null,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Renter Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _serviceController,
              decoration: InputDecoration(
                labelText: 'Rental Service',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                
                await uploadImage();
                SharedPreferences sp = await SharedPreferences.getInstance();
 var a = sp.getString('uid');

                await FirebaseFirestore.instance
                    .collection('rental_add_service')
                    .add({
                  'Renter Name': _nameController.text,
                  'Rental Service': _serviceController.text,

                  'image_url': imageUrl,
                  'pro_id':a,
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return RentalServicePage();

                    }));

              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadImage() async {
    try {
      if (profileImage != null) {
        Reference storageReference =
        FirebaseStorage.instance
            .ref()
            .child('image/${pickedFile!.name}');

        await storageReference.putFile(profileImage!);

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