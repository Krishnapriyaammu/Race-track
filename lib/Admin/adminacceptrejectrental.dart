import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminAcceptrejectRental extends StatefulWidget {
  final Map<String, dynamic> userData;
  String documentId;
   AdminAcceptrejectRental({super.key, required this. userData, required this. documentId});

  @override
  State<AdminAcceptrejectRental> createState() => _AdminAcceptrejectRentalState();
}

class _AdminAcceptrejectRentalState extends State<AdminAcceptrejectRental> {
Future<void> updateStatus(String? documentId) async {
  try {
    print('Document ID: $documentId'); // Print documentId for debugging
    if (documentId != null) {
      await FirebaseFirestore.instance
          .collection('rentalregister')
          .doc(documentId)
          .update({'status': 1});
      print('Status updated successfully');
    } else {
      print('Document ID is null');
    }
  } catch (e) {
    print('Error updating status: $e');
    throw e;
  }
}


  @override
  Widget build(BuildContext context) {
    var userData = widget.userData;
    var imageUrl = userData['image_url'];

    print('User Data: $userData'); // Print userData for debugging
    // print('Image URL: $imageUrl'); // Print imageUrl for debugging

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                imageUrl != null
                    ? Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                          radius: 50,
                        ),
                      )
                    : SizedBox(), // Placeholder if image URL is not available
                Center(
                  child: Column(
                    children: [
                      Text(userData['name'] ?? ''),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Text(
                    userData['place'] ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Text(
                    userData['mobile no'] ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Text(
                    userData['proof'] ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        updateStatus(widget.documentId);
                      },
                      child: Text('Accept'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement reject logic
                      },
                      child: Text('Reject'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
