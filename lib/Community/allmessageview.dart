import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Community/message.dart';


class ViewAllMessage extends StatefulWidget {
  const ViewAllMessage({super.key});

  @override
  State<ViewAllMessage> createState() => _ViewAllMessageState();
}

class _ViewAllMessageState extends State<ViewAllMessage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Messages'),
        backgroundColor: Color(0xFF075E54), // WhatsApp green color
        actions: [],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('community_register').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot<Object?> document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    // Display all users except the current user
if (_auth.currentUser != null && _auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email'] ?? ''),
        onTap: () {
          // Pass the clicked user's UID to the chat page
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Message(
          //       receiverUserEmail: data['email'],
          //       receiverUserID: data['uid'],
          //     ),
          //   ),
          // );
        },
      );
    } else {
      // Return an empty container if it's the current user
      return Container();
    }
  }
}