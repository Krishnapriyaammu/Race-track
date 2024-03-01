import 'package:flutter/material.dart';

class AdminViewUser extends StatefulWidget {
  const AdminViewUser({super.key});

  @override
  State<AdminViewUser> createState() => _AdminViewUserState();
}

class _AdminViewUserState extends State<AdminViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(backgroundColor: Colors.amber,),
  body: Column(
    children: [
      // Image.asset('images/racing.jpg'),
      Container(
        child: Image.asset('logo1.png'),
        height: 400,
        width: 200,
      ),
    ],
  )









    );
  }
}