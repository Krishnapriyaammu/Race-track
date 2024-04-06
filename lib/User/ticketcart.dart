// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loginrace/User/addpaymentdetails.dart';
// import 'package:loginrace/User/ticketbookingstatus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class ShoppingCart extends StatefulWidget {
//   final String name;
//   final double price;
//   final bool isVIP;
//   final int generalTickets; // Total number of general tickets
//   final int childTickets; // Total number of child tickets
//   final String rt_id;

//   ShoppingCart({
//     Key? key,
//     required this.name,
//     required this.price,
//     required this.isVIP,
//     required this.rt_id,
//     required this.generalTickets,
//     required this.childTickets,
//   }) : super(key: key);

//   @override
//   State<ShoppingCart> createState() => _ShoppingCartState();
// }

// class _ShoppingCartState extends State<ShoppingCart> {
//   TextEditingController _ticketController = TextEditingController(text: '1');
//   int _totalTickets = 1;

//   @override
//   void dispose() {
//     _ticketController.dispose();
//     super.dispose();
//   }

//   void _updateTotalTickets() {
//     setState(() {
//       _totalTickets = int.parse(_ticketController.text);
//     });
//   }

//   double _calculateTotalPrice() {
//     return widget.price * _totalTickets;
//   }

//   int _calculateTotalTickets() {
//   return widget.generalTickets + widget.childTickets;
//   }

//   Future<void> _storeTicketDetails() async {
//     try {
//       SharedPreferences sp = await SharedPreferences.getInstance();
//       var userid = sp.getString('uid');
//       await FirebaseFirestore.instance.collection('tickets').add({
//         'name': widget.name,
//         'price': widget.price,
//         'totalTickets': _calculateTotalTickets(), // Update to calculate total tickets
//         'totalPrice': _calculateTotalPrice(),
//         'timestamp': Timestamp.now(),
//         'userid': userid,
//         'rt_id': widget.rt_id,
//         'generalTickets': widget.generalTickets,
//         'childTickets': widget.childTickets,
//       });
//       // Successfully stored details in Firestore
//       print('Ticket details stored successfully.');
//       Fluttertoast.showToast(
//         msg: 'Ticket booking successful!',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//       );

//       // Navigate back to previous page
//  Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ViewStatusPage(
//             ticketName: widget.name,
//             totalPrice: _calculateTotalPrice(),
//             totalTickets: _calculateTotalTickets(),
//           ),
//         ),
//       );
//     } catch (e) {
//       // Error occurred while storing details
//       print('Error storing ticket details: $e');
//     }
//   }

//   @override
//  Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Cart',
//         style: GoogleFonts.poppins(),
//       ),
//       backgroundColor: Color.fromARGB(255, 96, 150, 212),
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Ticket Details:',
//             style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Name: ${widget.name}',
//             style: GoogleFonts.poppins(fontSize: 18),
//           ),
//           SizedBox(height: 10),
          
//           if (widget.isVIP) SizedBox(height: 10),
//           Text(
//             widget.isVIP ? 'VIP Pass: Yes' : '',
//             style: GoogleFonts.poppins(fontSize: 18),
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: [
//               Text(
//                 'Total Adult Tickets Booked:',
//                 style: GoogleFonts.poppins(fontSize: 18),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 widget.generalTickets.toString(), // Display total general tickets
//                 style: GoogleFonts.poppins(fontSize: 18),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               Text(
//                 'Total Child Tickets Booked:',
//                 style: GoogleFonts.poppins(fontSize: 18),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 widget.childTickets.toString(), // Display total child tickets
//                 style: GoogleFonts.poppins(fontSize: 18),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               Text(
//       'Total Tickets:',
//       style: GoogleFonts.poppins(fontSize: 18),
//     ),
//               SizedBox(width: 10),
//               Text(
//                 _calculateTotalTickets().toString(),
//                 style: GoogleFonts.poppins(fontSize: 18),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Total Price: \$${_calculateTotalPrice().toStringAsFixed(2)}',
//             style: GoogleFonts.poppins(fontSize: 18),
//           ),
//           SizedBox(height: 40),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 _storeTicketDetails();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                 child: Text(
//                   'Book Tickets',
//                   style: GoogleFonts.poppins(fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }