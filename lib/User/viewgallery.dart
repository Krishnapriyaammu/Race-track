import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewGallery extends StatefulWidget {
  const ViewGallery({super.key});

  @override
  State<ViewGallery> createState() => _ViewGalleryState();
}

class _ViewGalleryState extends State<ViewGallery> {

     Future<List<DocumentSnapshot>> getdata() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('race_track_add_gallery')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'RACR GALLERY',
                style: GoogleFonts.getFont(
                  'Josefin Sans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: getdata(),
                builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final document = snapshot.data![index];
                        final data = document.data() as Map<String, dynamic>;
                        final imageUrl = data['image_url'];

                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => EventDetaild()),
                            // );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}