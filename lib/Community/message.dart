// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:loginrace/service/chat_service.dart';

// class Message extends StatefulWidget {
//   final String receiverUserEmail;
//   final String receiverUserID;
//    Message({super.key, required this.receiverUserEmail, required this.receiverUserID, required String senderId, required String senderEmail, required String receiverId, required Timestamp timestamp, required String message});

//   @override
//   State<Message> createState() => _MessageState();
// }

// class _MessageState extends State<Message> {

//    final TextEditingController _messageController = TextEditingController();
//   final ChatService _chatService = ChatService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
//   void sendMessage() async {
//     // Only send message if there is something to send
//     if (_messageController.text.isNotEmpty) {
//       await _chatService.sendMessage(
//           widget.receiverUserID, _messageController.text);
//       // Clear the text controller after sending the message
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.receiverUserEmail),
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
//     return StreamBuilder(
//       stream: _chatService.getMessage(
//           widget.receiverUserID, _firebaseAuth.currentUser!.uid),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error${snapshot.error}');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text('Loading...');
//         }
//         return ListView(
//           children: snapshot.data!.docs
//               .map((document) => _buildMessageItem(document))
//               .toList(),
//         );
//       },
//     );
//   }

//   // Build message item
//   Widget _buildMessageItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data() as Map<String, dynamic>;

//     // Align the message to the right if the sender is the current user, otherwise to the left
//     var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
//         ? Alignment.centerRight
//         : Alignment.centerLeft;
//     return Container(
//       alignment: alignment,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment:
//               (data['senderId'] == _firebaseAuth.currentUser!.uid)
//                   ? CrossAxisAlignment.end
//                   : CrossAxisAlignment.start,
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
//           // Textfield
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
//               Icons.send,
//               size: 30,
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
//   const MyTextFields(
//       {super.key,
//       required this.controller,
//       required this.hintText,
//       required this.obscureText});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade200),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           fillColor: Colors.grey[100],
//           filled: true,
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.grey)),
//     );
//   }
// }