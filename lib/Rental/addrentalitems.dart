import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RentalServicePage extends StatefulWidget {
  @override
  _RentalServicePageState createState() => _RentalServicePageState();
}



class _RentalServicePageState extends State<RentalServicePage> {
  // var name=TextEditingController();
  var profileImage;
  var pickedFile;
  String imageUrl='';
   File? image;
 File? _selectedImage;

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Service Products'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                       
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteProductDialog(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddProductDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showAddProductDialog() {
    var service=TextEditingController();
    var name=TextEditingController();
     String imageUrl='';


   

    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Add Product'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
          
           GestureDetector(
                          onTap: () async {
                            ImagePicker picker = ImagePicker();
                            pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);

                            setState(() {
                              if (pickedFile != null) {
                                profileImage = File(pickedFile!.path);
                              }
                            });
                          },
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: profileImage != null
                                  ? FileImage(profileImage)
                                  : null,
                              child: profileImage == null
                                  ? Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      SizedBox(height: 16),
                       TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          hintText: 'name',
                        ),
                      ),
                      SizedBox(height: 16,),
          
          
                TextField(
                  controller: service,
                  decoration: InputDecoration(labelText: 'service'),
                  onChanged: (value) {
                  },
                ),
               
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: ()  async{
                  await uploadImage();
                   await FirebaseFirestore.instance.collection("rentaladdservice").add({
                         'name':name.text,
                         'service':service.text,
                          'image_url': imageUrl,
          
                        
                        
                                           });
                  
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteProductDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // products.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
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







