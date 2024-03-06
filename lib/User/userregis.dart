import 'package:flutter/material.dart';
import 'package:loginrace/User/userlogin.dart';

class UserRgistration extends StatefulWidget {
  const UserRgistration({super.key});

  @override
  State<UserRgistration> createState() => _UserRgistrationState();
}

class _UserRgistrationState extends State<UserRgistration> {
  var name=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();
  var place=TextEditingController();
  var image=TextEditingController();
  var license=TextEditingController();
  var pass=TextEditingController();
  var conf=TextEditingController();
      final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: fkey,
              child: Container(
                width: 400,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter username';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Name',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                         TextFormField(
                          controller: phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone number';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android_sharp),
                            hintText: 'phone',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                          SizedBox(height: 20),
                         TextFormField(
                          controller: place,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter location';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.place_outlined),
                            hintText: 'place',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                          SizedBox(height: 20),
                         TextFormField(
                          controller: image,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'upload image';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.image_outlined),
                            hintText: 'image',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                          SizedBox(height: 20),
                         TextFormField(
                          controller: license,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'upload license';
                            }
                             // Validation passed
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.local_convenience_store_outlined),
                            hintText: 'license',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                          SizedBox(height: 20),
                         TextFormField(
                          controller: pass,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            }
                           // Validation passed
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: 'password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                          SizedBox(height: 20),
                         TextFormField(
                          controller: conf,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter confirm password';
                            }
                            // Validation passed
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: 'confirm password',
                            filled: true,
                            fillColor:  Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        
                          SizedBox(height: 20),


                       
                        ElevatedButton(
                          onPressed: () {
                            if (fkey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return UserLogin();
                                }),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blueAccent,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
}