import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginrace/User/viewautoshowdetails.dart';

class ViewAutoshow extends StatefulWidget {
  const ViewAutoshow({super.key});

  @override
  State<ViewAutoshow> createState() => _ViewAutoshowState();
}

class _ViewAutoshowState extends State<ViewAutoshow> {
  TextEditingController _searchController = TextEditingController();


   Future<List<DocumentSnapshot>> getdata() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto show'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Customize the background color
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5), // Customize the shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for auto shows',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getdata(),
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
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 244, 241, 245), // Customize the card background color
                          child: Row(
                            children: [
                              // Left Container
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return ViewAutoshowDetails();
                                          }));
                                        },
                                        child: Text(
                                          data['Community name'] ?? 'Name not available',
                                          style: TextStyle(
                                            fontSize: 20, // Customize the font size
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black, // Customize the text color
                                          ),
                                        ),
                                      ),
                                      // Your existing code...
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 20,
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '3.0',
                                            style: TextStyle(
                                              fontSize: 18, // Customize the font size
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black, // Customize the text color
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Your existing code...
                                    ],
                                  ),
                                ),
                              ),

                              // Right Container
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: imageUrl != null
                                    ? Image.network(imageUrl, fit: BoxFit.cover)
                                    : Icon(Icons.image),
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
    );
  }
}