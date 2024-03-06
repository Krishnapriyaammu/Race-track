import 'package:flutter/material.dart';
import 'package:loginrace/User/payemettype.dart';

class TrackBookingPayment extends StatefulWidget {
  const TrackBookingPayment({Key? key}) : super(key: key);

  @override
  State<TrackBookingPayment> createState() => _TrackBookingPaymentState();
}

class _TrackBookingPaymentState extends State<TrackBookingPayment> {
  TextEditingController dateController = TextEditingController();
    final _formKey = GlobalKey<FormState>();


  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40.00),
            child: Container(
              width: 400,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTextField('Name', 'Enter your name', (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      }),
                      _buildTextField('Phone number', 'Enter your phone number', (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      }),
                      _buildTextField('Level', 'Enter the level', (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the level';
                        }
                        return null;
                      }),
                      _buildTextField('Amount', 'Enter the amount', (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the amount';
                        }
                        return null;
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                readOnly: true,
                                controller: dateController,
                                decoration: InputDecoration(
                                  hintText: 'Select Date',
                                  fillColor: Color.fromARGB(112, 243, 214, 214),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please select a date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PayementType();
                                },
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, String hintText, String? Function(String?)? validator) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(labelText),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Color.fromARGB(112, 243, 214, 214),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
