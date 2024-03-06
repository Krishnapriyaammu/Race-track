import 'package:flutter/material.dart';
import 'package:loginrace/Community/addcommunitydetails.dart';
import 'package:loginrace/Community/viewprofileComm.dart';

class Commueditprofile extends StatefulWidget {
  const Commueditprofile({super.key});

  @override
  State<Commueditprofile> createState() => _CommueditprofileState();
}

class _CommueditprofileState extends State<Commueditprofile> {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var place = TextEditingController();
  var proof = TextEditingController();
  var vehicles = TextEditingController();
  final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: fkey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 227, 102, 113),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: ' Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: place,
                  decoration: InputDecoration(
                    labelText: 'Place',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your place';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: vehicles,
                  decoration: InputDecoration(
                    labelText: 'Total vehicles',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the total number of vehicles';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: proof,
                  decoration: InputDecoration(
                    labelText: 'Proof',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your proof';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (fkey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CommViewProfile();
                        }));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 124, 130)),
                    ),
                    child: Text('DONE', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
