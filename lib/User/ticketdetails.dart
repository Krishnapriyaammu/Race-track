import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/ticketcart.dart';

class EventTicketDetails extends StatefulWidget {
  String rt_id;
   EventTicketDetails(  { Key? key,   required this.rt_id}): super(key: key);

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
        child: SingleChildScrollView(
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCart(rt_id: widget.rt_id,
                          name: _name,
                          category: _selectedCategory,
                          price: _calculatePrice(),
                          isVIP: _isVIP, // Pass the value of isVIP to ShoppingCart
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Book Tickets',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
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