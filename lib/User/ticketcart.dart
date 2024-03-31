import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/addpaymentdetails.dart';

class ShoppingCart extends StatefulWidget {
   final String name;
  final String category;
  final double price;

   ShoppingCart({super.key, required this. name, required this. category, required this. price});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  @override
  Widget build(BuildContext context) {
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
              'Name: ',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to increase ticket count
              },
              child: Text('Increase Ticket Count'),
            ),
          ],
        ),
      ),
    );
  }
}