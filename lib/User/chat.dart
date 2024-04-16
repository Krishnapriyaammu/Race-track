// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:loginrace/Community/chatservice.dart';
// import 'package:loginrace/service/chat_service.dart';

// class ChatPage extends StatefulWidget {
//   String userEmail;
//   String userId;
//    ChatPage({super.key, required this. userId, required this. userEmail});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {


  
//  final TextEditingController _messageController = TextEditingController();
//   final ChatService _chatService = ChatService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   void sendMessage() async {
//     // Only send message if there is something to send
//     if (_messageController.text.isNotEmpty) {
//       await _chatService.sendMessage(widget.userId, _messageController.text);
//       // Clear the text controller after sending the message
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.userEmail),
//       ),
//       body: Column(
//         children: [
//           // Message
//           Expanded(
//             child: _buildMessageList(),
//           ),
//           // User input
//           _buildMessageInput(),
//           const SizedBox(
//             height: 25,
//           )
//         ],
//       ),
//     );
//   }

//   // Build message list
//   Widget _buildMessageList() {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: _chatService.getMessage(widget.userId, _firebaseAuth.currentUser?.uid ?? ''),
//       builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
//           return const Text('No messages available.');
//         }
//         return ListView(
//           children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
//         );
//       },
//     );
//   }

//   // Build message item
//   Widget _buildMessageItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data() as Map<String, dynamic>;

//     // Align the message to the right if the sender is the current user, otherwise to the left
//     var alignment = (data['senderId'] == _firebaseAuth.currentUser?.uid)
//         ? Alignment.centerRight
//         : Alignment.centerLeft;
//     return Container(
//       alignment: alignment,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(data['senderEmail']),
//             const SizedBox(
//               height: 5,
//             ),
//             ChatBubble(message: data['message']),
//           ],
//         ),
//       ),
//     );
//   }

//   // Build message input
//   Widget _buildMessageInput() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: Row(
//         children: [
//           // Text field
//           Expanded(
//             child: MyTextFields(
//               controller: _messageController,
//               hintText: 'Enter Message',
//               obscureText: false,
//             ),
//           ),
//           // Send button
//           IconButton(
//             onPressed: sendMessage,
//             icon: Icon(
//               Icons.arrow_upward,
//               size: 40,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String message;
//   const ChatBubble({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.blue, // Set the background color here
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         message,
//         style: TextStyle(
//           fontSize: 16,
//           color: Colors.white, // Optional: Text color
//         ),
//       ),
//     );
//   }
// }

// class MyTextFields extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;
//   const MyTextFields({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.obscureText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade200),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//         fillColor: Colors.grey[100],
//         filled: true,
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.grey),
//       ),
//     );
//   }
// }