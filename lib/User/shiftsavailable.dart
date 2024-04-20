import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginrace/Community/booking.dart';
import 'package:loginrace/User/bookingstatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShiftAvailable extends StatefulWidget {
 final String rt_id;
  final String totalPrice;
  final int totalHours;
  final TimeOfDay startTime;

    ShiftAvailable({
    Key? key,
    required this.rt_id,
    required this.totalPrice,
    required this.totalHours,
    required this.startTime,
  }) : super(key: key);

  @override
  State<ShiftAvailable> createState() => _ShiftAvailableState();
}

class _ShiftAvailableState extends State<ShiftAvailable> {
    String selectedSlot = '';
  String selectedPaymentOption = '';
  List<String> paymentOptions = ['Credit Card', 'Google Pay', 'PayPal'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  // Add GlobalKey
   void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Slot and Payment Option'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the GlobalKey to the Form widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Choose a Slot:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SlotButton(
                slotName: 'Morning',
                isSelected: selectedSlot == 'Morning',
                onTap: () {
                  setState(() {
                    selectedSlot = 'Morning';
                  });
                },
              ),
              SizedBox(height: 10),
              SlotButton(
                slotName: 'Evening',
                isSelected: selectedSlot == 'Evening',
                onTap: () {
                  setState(() {
                    selectedSlot = 'Evening';
                  });
                },
              ),
              SizedBox(height: 10),
              SlotButton(
                slotName: 'Night',
                isSelected: selectedSlot == 'Night',
                onTap: () {
                  setState(() {
                    selectedSlot = 'Night';
                  });
                },
              ),
              SizedBox(height: 40),
              Text(
                'Selected Slot: $selectedSlot',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
              Text(
                'Select Payment Option:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedPaymentOption.isNotEmpty ? selectedPaymentOption : null,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPaymentOption = newValue!;
                  });
                },
                items: paymentOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Selected Payment Option: $selectedPaymentOption',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(), // Add spacer to push the button to the bottom
              SizedBox(
                height: 40, // Set the height of the button
                width: double.infinity, // Set the width to match the parent width
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        SharedPreferences sp = await SharedPreferences.getInstance();
                        var userid = sp.getString('uid');

                        await FirebaseFirestore.instance.collection('user_race_track_booking').add({
                          'rt_id': widget.rt_id,
                          'userid': userid,
                          'totalPrice': widget.totalPrice,
                          'totalHours': widget.totalHours,
                          'startTime': widget.startTime.toString(),
                          'selectedSlot': selectedSlot,
                          'selectedPaymentOption': selectedPaymentOption,
                          'status': '0',
                        });
                                _showToast('Booking has been successfully done');
                                  Navigator.push(
                                              context,
          MaterialPageRoute(builder: (context) => BookingStatusPage()),
        ); // Show toast message

                        print('Data stored successfully.');
                      } catch (e) {
                        print('Error storing data: $e');
                      }
                    }
                  },
                  child: Text('Submit'), // Add child property
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60), // Adjust the padding
                    textStyle: TextStyle(fontSize: 16), // Adjust the text size
                  ),
                ),
              ),
              SizedBox(height: 20), // Add some space between the button and the bottom edge
            ],
          ),
        ),
      ),
    );
  }
}

class SlotButton extends StatelessWidget {
  final String slotName;
  final bool isSelected;
  final VoidCallback onTap;

  const SlotButton({
    required this.slotName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            slotName,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}