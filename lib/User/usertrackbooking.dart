import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/addpaymentdetails.dart';
import 'package:loginrace/User/payemettype.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTrackBooking extends StatefulWidget {
  String rt_id;
  
   UserTrackBooking({Key? key, required this. rt_id, }) : super(key: key);

  @override
  State<UserTrackBooking> createState() => _UserTrackBookingState();
}

class _UserTrackBookingState extends State<UserTrackBooking> {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var place = TextEditingController();
  var date=TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_motorsports,
                          size: 64,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Join the Adventure!',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 20),
                        buildTextFieldRow('Name', Icons.person, name, (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }),
                        buildTextFieldRow('Email', Icons.email, email, (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        }),
                        buildTextFieldRow('Phone Number', Icons.phone, phone, (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        }),
                        buildTextFieldRow('Place', Icons.location_on, place, (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your place';
                          }
                          return null;
                        }),
                         
                      
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () async {
                             
                  SharedPreferences sp = await SharedPreferences.getInstance();
                          var uid = sp.getString('uid');
                
                            
                             await FirebaseFirestore.instance.collection("user_track_booking").add({
                         'name':name.text,
                         'email':email.text,
                         'phone':phone.text,
                         'place':place.text,
                         'uid':uid,
                           
                         'rt_id': widget.rt_id,

                         
                     });
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
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text('Next', style: TextStyle(color: Colors.white)),
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
      ),
    );
  }

  Widget buildTextFieldRow(
      String label, IconData icon, TextEditingController controller, String? Function(String?)? validator) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(icon, color: Colors.blue),
            ),
            Text(label),
          ],
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: label,
            fillColor: Color.fromARGB(112, 243, 214, 214),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
