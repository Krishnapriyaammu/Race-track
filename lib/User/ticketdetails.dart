import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/ticketcart.dart';

class EventTicketDetails extends StatefulWidget {
  const EventTicketDetails({super.key});

  @override
  State<EventTicketDetails> createState() => _EventTicketDetailsState();
}

class _EventTicketDetailsState extends State<EventTicketDetails> {

  String _name = '';
  String _selectedCategory = 'General';
  bool _isVIP = false;

  // Define ticket prices
  double _generalPrice = 100.0;
  double _childPrice = 50.0;
  double _vipPrice = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Booking',
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
              'Name:',
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Category:',
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: ['General', 'Child']
                  .map<DropdownMenuItem<String>>(
                    (category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'VIP Pass:',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                SizedBox(width: 10),
                Checkbox(
                  value: _isVIP,
                  onChanged: (value) {
                    setState(() {
                      _isVIP = value ?? false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price:',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                Text(
                  _calculatePrice().toString(),
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
 Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingCart(
              name: _name,
              category: _selectedCategory,
              price: _calculatePrice(),
            )),
          );                },
                child: Text(
                  'Book Tickets',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate ticket price based on category and VIP status
  double _calculatePrice() {
    if (_selectedCategory == 'General') {
      return _isVIP ? _generalPrice + _vipPrice : _generalPrice;
    } else {
      return _isVIP ? _childPrice + _vipPrice : _childPrice;
    }
  }
}