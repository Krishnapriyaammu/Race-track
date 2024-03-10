import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Rental/rentalregistration.dart';
import 'package:loginrace/Rental/rentelhome.dart';
import 'package:loginrace/Rental/rentnavigation.dart';

class RentalLogin extends StatefulWidget {
  const RentalLogin({super.key});

  @override
  State<RentalLogin> createState() => _RentalLoginState();
}

class _RentalLoginState extends State<RentalLogin> {
  var username = TextEditingController();
  var pass = TextEditingController();
    final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Container(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/logo1.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.all(10)),
                      Text('Enter username'),
                    ],
                  ),
                  TextFormField(
                    controller: username,
                    validator: (value) {
                       if (value!.isEmpty) {
                        return 'enter username';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'username',
                        fillColor: Color.fromARGB(255, 200, 225, 255),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.all(10)),
                      Text('Enter Password'),
                    ],
                  )),
                  TextFormField(
                    controller: pass,
                    validator: (value) {
                       if (value!.isEmpty) {
                        return 'enter password';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Color.fromARGB(255, 200, 225, 255),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Color.fromARGB(255, 27, 23, 229),
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return RentalRegister();
                              },));
                            },
                            child: Text('SIGN UP')),
                       
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                         await FirebaseFirestore.instance.collection("rentallogin").add({
                       'name':username.text,
                       'email':pass.text,
                      
                                         });
                        print(username.text);
                        print(pass.text);
                         if (fkey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RentNavigationbar();
                          },
                        ));
                       
                      }
                       
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 111, 173, 249))),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
