import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = []; // List to store messages

  // Function to send message
  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
      _messageController.clear(); // Clear message input field after sending
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Messaging'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200], // Background color for message list
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent, // Message bubble color
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(fontSize: 16.0, color: Colors.white), // Text color
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(height: 0), // Divider to separate messages from input field
          Container(
            color: Colors.white, // Background color for input field
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none, // Remove border
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    String message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}