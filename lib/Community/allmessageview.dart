import 'package:flutter/material.dart';
import 'package:loginrace/Community/message.dart';

class ViewAllMessage extends StatefulWidget {
  const ViewAllMessage({super.key});

  @override
  State<ViewAllMessage> createState() => _ViewAllMessageState();
}

class _ViewAllMessageState extends State<ViewAllMessage> {
  final List<Map<String, String>> messages = [
    {"user": "John", "message": "Hello there!"},
    {"user": "Alice", "message": "Hey, how are you?"},
    {"user": "Bob", "message": "What's up?"},
    // Add more messages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Messages'),
        backgroundColor: Color(0xFF075E54), // WhatsApp green color
        actions: [
         
         
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Column(
            children: [
             ListTile(
                leading: CircleAvatar(
                  child: Text(
                    message["user"]![0], // Display first letter of user's name
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color(0xFF128C7E), // WhatsApp green color
                ),
                title: Text(
                  message["user"] ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(message["message"] ?? ""),
                onTap: () {
                  // Navigate to Message() page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Message()),
                  );
                },
              ),
              Divider(
                height: 1,
                color: Colors.grey[300],
                indent: 72, // Indent to match leading avatar
              ),
            ],
          );
        },
      ),
    );
  }
}
