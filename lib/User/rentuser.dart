import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/bookautoshow.dart';
import 'package:loginrace/User/payemettype.dart';

class RentUser extends StatefulWidget {
  const RentUser({Key? key}) : super(key: key);

  @override
  State<RentUser> createState() => _RentUserState();
}

class _RentUserState extends State<RentUser> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextFieldRow('Name', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }),
                        _buildTextFieldRow('Email', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        }),
                        _buildTextFieldRow('Location', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your location';
                          }
                          return null;
                        }),
                        _buildTextFieldRow('Phone Number', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        }),
                        _buildTextFieldRow('Date of rent', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the date of rent';
                          }
                          return null;
                        }),
                        _buildTextFieldRow('Due date', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the due date';
                          }
                          return null;
                        }),
                        _buildTextFieldRow('Payment', (value) {
                          if (value!.isEmpty) {
                            return 'Please enter payment details';
                          }
                          return null;
                        }),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return PayementType();
                                }),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color.fromARGB(255, 94, 76, 224)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                          ),
                          child: Text('SUBMIT',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldRow(String labelText, String? Function(String?)? validator) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  Text(labelText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        TextFormField(
          validator: validator,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: labelText,
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
