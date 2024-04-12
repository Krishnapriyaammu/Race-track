import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Houston Community'),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Handle voice call
            },
          ),
        ],
      ),
     body: Container(
        color: Colors.grey[200], // Background color for message list
        // Display messages from Firestore
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('messages').orderBy('timestamp', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final documents = snapshot.data!.docs;
            return ListView.builder(
              reverse: true, // Display newest messages at the bottom
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final message = documents[index]['message'];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent, // Message bubble color
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 16.0, color: Colors.white), // Text color
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}