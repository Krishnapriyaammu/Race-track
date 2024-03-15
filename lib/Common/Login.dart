import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Admin/adminhome.dart';
import 'package:loginrace/Community/communityregis.dart';
import 'package:loginrace/Community/navigation.dart';
import 'package:loginrace/Racetrack/navigationracetrack.dart';
import 'package:loginrace/Racetrack/racetrackhome1.dart';
import 'package:loginrace/Racetrack/registration.dart';
import 'package:loginrace/Rental/rentalregistration.dart';
import 'package:loginrace/Rental/rentnavigation.dart';
import 'package:loginrace/User/navigationuser.dart';
import 'package:loginrace/User/userregis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  String type;
  Login({super.key, required this.type});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var user = TextEditingController();
  var pass = TextEditingController();
  final fkey = GlobalKey<FormState>();

  Future<void> checkData() async {
    if (user.text == 'admin@gmail.com' && pass.text == 'admin123') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AdminHome();
      }));
    }

    if (widget.type == 'user') {
      final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('user_register')
          .where('username', isEqualTo: user.text)
          .where('password', isEqualTo: pass.text)
          // .where('status', isEqualTo: 1)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        var userid = userSnapshot.docs[0].id;
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('uid', userid);

        //  if (mechSnapshot.docs.isNotEmpty) {

        // Fluttertoast.showToast(msg: 'Login Successful as Mechanic');
        // print('Mechanic ID: $mechId');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return NavigationUser();
        }));
        //   }
      } else {
        // Show an error message to the user
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

      if (widget.type == 'race track') {
        final QuerySnapshot raceSnapshot = await FirebaseFirestore.instance
            .collection('race_track_register')
            .where('username', isEqualTo: user.text)
            .where('password', isEqualTo: pass.text)
            // .where('status', isEqualTo: 1)
            .get();

        if (raceSnapshot.docs.isNotEmpty) {
          var userid = userSnapshot.docs[0].id;
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString('uid', userid);

          //  if (mechSnapshot.docs.isNotEmpty) {

          // Fluttertoast.showToast(msg: 'Login Successful as Mechanic');
          // print('Mechanic ID: $mechId');
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return RaceTrackNavigation();
          }));
          //   }
        } else {
          // Show an error message to the user
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Login Failed'),
              content: Text('Invalid username or password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
        if (widget.type == 'renatl') {
          final QuerySnapshot rentSnapshot = await FirebaseFirestore.instance
              .collection('rentalregister')
              .where('username', isEqualTo: user.text)
              .where('password', isEqualTo: pass.text)
              // .where('status', isEqualTo: 1)
              .get();
          if (rentSnapshot.docs.isNotEmpty) {
            var userid = userSnapshot.docs[0].id;
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString('uid', userid);

            //  if (mechSnapshot.docs.isNotEmpty) {

            // Fluttertoast.showToast(msg: 'Login Successful as Mechanic');
            // print('Mechanic ID: $mechId');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return RentNavigationbar();
            }));
            //   }
          } else {
            // Show an error message to the user
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Login Failed'),
                content:
                    Text('Invalid username or password. Please try again.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
          if (widget.type == 'community') {
            final QuerySnapshot commSnapshot = await FirebaseFirestore.instance
                .collection('CommunityRegister')
                .where('username', isEqualTo: user.text)
                .where('password', isEqualTo: pass.text)
                // .where('status', isEqualTo: 1)
                .get();

            if (commSnapshot.docs.isNotEmpty) {
              var userid = userSnapshot.docs[0].id;
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString('uid', userid);

              //  if (mechSnapshot.docs.isNotEmpty) {

              // Fluttertoast.showToast(msg: 'Login Successful as Mechanic');
              // print('Mechanic ID: $mechId');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Navigation();
              }));
              //   }
            } else {
              // Show an error message to the user
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Login Failed'),
                  content:
                      Text('Invalid username or password. Please try again.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          }
        }
      }
    }
  }
        @override
        Widget build(BuildContext context) {
          double height = MediaQuery.of(context).size.height;

          return Scaffold(
            body: Center(
                child: Center(
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
                            controller: user,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter username';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'username',
                                fillColor: Color.fromARGB(111, 247, 73, 73),
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
                                fillColor: Color.fromARGB(111, 247, 73, 73),
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
                                      if (widget.type == 'user') {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return UserRgistration();
                                          },
                                        ));
                                      }
                                      if (widget.type == 'race track') {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return raceRegistration();
                                          },
                                        ));
                                      }
                                      if (widget.type == 'rental') {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return RentalRegister();
                                          },
                                        ));
                                      }
                                      if (widget.type == 'community') {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return CommunityRegister();
                                          },
                                        ));
                                      }
                                    },
                                    child: Text('SIGN UP')),
                                //  child: Text(
                                //     'Sign Up',
                                //     style: TextStyle(
                                //       color: const Color.fromARGB(255, 24, 24, 24),
                                //       decoration: TextDecoration.underline,
                                //     ),
                                //   ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (fkey.currentState!.validate()) {
                                  checkData();
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return NavigationUser();

                                  // }));
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 217, 149, 149))),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          );
        }
      }
    
    
  

