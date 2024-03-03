import 'package:flutter/material.dart';
import 'package:loginrace/Admin/acceptrejectcommunity.dart';

class AdminViewCommunity extends StatefulWidget {
  const AdminViewCommunity({super.key});

  @override
  State<AdminViewCommunity> createState() => _AdminViewCommunityState();
}

class _AdminViewCommunityState extends State<AdminViewCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
          title: Text('Community List'),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('images/imaaaa.jpg'),),
              title: Text('Race Vibe hub'),
              subtitle: Text('krishnaammu123@gmail.com'),
              trailing: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AdminAcceptRejectCommunity();
                  },));
              },
                child: Icon(Icons.navigate_next)),
            );
          },
        ),






    );
  }
}