import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/addpaymentdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCart extends StatefulWidget {
   final String name;
  final String category;
  final double price;
  final bool isVIP;
  String rt_id;

 ShoppingCart(  {Key? key, required this.name, required this.category, required this.price, required this.isVIP, required this.rt_id})
      : super(key: key, );
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

   

  Future<void> _storeTicketDetails() async {
  try {
     SharedPreferences sp = await SharedPreferences.getInstance();
                     
       var userid = sp.getString('uid');
    await FirebaseFirestore.instance.collection('tickets').add({
      'name': widget.name,
      'category': widget.category,
      'price': widget.price,
      'totalTickets': _totalTickets,
      'totalPrice': _calculateTotalPrice(),
      'timestamp': Timestamp.now(),
      'userid':userid,
          'rt_id':widget.rt_id,

    });
    // Successfully stored details in Firestore
    print('Ticket details stored successfully.');
  } catch (e) {
    // Error occurred while storing details
    print('Error storing ticket details: $e');
  }
}



   TextEditingController _ticketController = TextEditingController(text: '1');
  int _totalTickets = 1;

  @override
  void dispose() {
    _ticketController.dispose();
    super.dispose();
  }

  void _updateTotalTickets() {
    setState(() {
      _totalTickets = int.parse(_ticketController.text);
    });
  }

  double _calculateTotalPrice() {
    return widget.price * _totalTickets;
  }
 
     
  @override
  Widget build(BuildContext context) {
      print("isVIP value: ${widget.isVIP}");

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Cart',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromARGB(255, 96, 150, 212),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket Details:',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Name: ${widget.name}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${widget.category}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${widget.price.toStringAsFixed(2)}', // Format price to display with 2 decimal places
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            if (widget.isVIP)
             // Display VIP pass information if selected
              SizedBox(height: 10),
              Text(
  widget.isVIP ? 'VIP Pass: Yes' : '', // Only display if VIP pass is selected
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Total Tickets:',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: _ticketController,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => _updateTotalTickets(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: \$${_calculateTotalPrice().toStringAsFixed(2)}', // Format total price with 2 decimal places
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
    _storeTicketDetails();

                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Book Tickets',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}