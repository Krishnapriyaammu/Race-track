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
  appBar: AppBar(
          title: Text('User List'),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('images/imaaaa.jpg'),),
              title: Text('Krishnapriya'),
              subtitle: Text('krishnaammu123@gmail.com'),
              trailing: Icon(Icons.navigate_next),
            );
          },
        ),
      );
      

    
  }
}

