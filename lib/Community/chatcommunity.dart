import 'package:flutter/material.dart';

class ChatCommunity extends StatefulWidget {
  const ChatCommunity({super.key});

  @override
  State<ChatCommunity> createState() => _ChatCommunityState();
}

class _ChatCommunityState extends State<ChatCommunity> {
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
             
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200], 
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    text: messages[index],
                    isMe: index % 2 == 0, 
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write your message...',
                      filled: true,
                      fillColor: Colors.white, 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onChanged: (text) {
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      messages.add('Helloo'); 
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Color.fromARGB(255, 207, 96, 96) : Color.fromARGB(255, 86, 141, 189), // Message bubble color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}