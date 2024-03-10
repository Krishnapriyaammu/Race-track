import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TrackDetailsGallery extends StatefulWidget {
  const TrackDetailsGallery({super.key});

  @override
  State<TrackDetailsGallery> createState() => _TrackDetailsGalleryState();
}

class _TrackDetailsGalleryState extends State<TrackDetailsGallery> with SingleTickerProviderStateMixin {
 late TabController _tabController;
 var track=TextEditingController();
 var surface=TextEditingController();
 var turns=TextEditingController();
 var record=TextEditingController();
  File? _selectedImage;
  List<File> trackImages = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        actions: [
          _tabController.index == 0
              ? IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // _showAddImageDialog(context);
                  },
                )
              : Container(),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Our Track Tab
          SingleChildScrollView(
            child: Column(
              children: [
                // Image Picker
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile =
                        await ImagePicker().getImage(source: ImageSource.gallery);

                    setState(() {
                      if (pickedFile != null) {
                        _selectedImage = File(pickedFile.path);
                      }
                    });
                  },
                  child: Text('Pick Image'),
                ),
                SizedBox(height: 16),

                _selectedImage != null
                    ? Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(),
                TextField(
                  controller: track,
                  decoration: InputDecoration(
                    labelText: 'Track Name',
                  ),
                ),
                SizedBox(height: 16),

                // Surface Length TextField
                TextField(
                  controller: surface,
                  decoration: InputDecoration(
                    labelText: 'Surface Length',
                  ),
                ),
                SizedBox(height: 16),

                // Number of Turns TextField
                TextField(
                  controller: turns,
                  decoration: InputDecoration(
                    labelText: 'Number of Turns',
                  ),
                ),
                SizedBox(height: 16),

                // Lap Record TextField
                TextField(
                  controller: record,
                  decoration: InputDecoration(
                    labelText: 'Lap Record',
                  ),
                ),
              ],
            ),
          ),

          // Gallery Tab
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: trackImages.length,
            itemBuilder: (context, index) {
              return Image.file(trackImages[index], fit: BoxFit.cover);
            },
          ),
        ],
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
              onPressed: () {
                // _showAddImageDialog(context);
              },
              child: Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Our Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
        ],
      ),
    );
  }

  
   

    
        
}