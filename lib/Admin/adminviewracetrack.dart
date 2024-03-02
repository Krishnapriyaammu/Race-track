import 'package:flutter/material.dart';

class AdminViewRacetrack extends StatefulWidget {
  const AdminViewRacetrack({super.key});

  @override
  State<AdminViewRacetrack> createState() => _AdminViewRacetrackState();
}

class _AdminViewRacetrackState extends State<AdminViewRacetrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
          title: Text('Race track List'),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('images/imaaaa.jpg'),),
              title: Text('Kari Motors'),
              subtitle: Text('krishnaammu123@gmail.com'),
              trailing: Icon(Icons.navigate_next),
            );
          },
        ),





    );
  }
}