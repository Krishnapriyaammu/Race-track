import 'package:flutter/material.dart';
import 'package:loginrace/Admin/adminacceptrejectrental.dart';

class AdminViewRental extends StatefulWidget {
  const AdminViewRental({super.key});

  @override
  State<AdminViewRental> createState() => _AdminViewRentalState();
}

class _AdminViewRentalState extends State<AdminViewRental> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
          title: Text('Rental List'),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('images/imaaaa.jpg'),),
              title: Text('Motor hub'),
              subtitle: Text('krishnaammu123@gmail.com'),
              trailing: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AdminAcceptrejectRental();
                  },));
              },
                child: Icon(Icons.navigate_next)),
            );
          },
        ),






    );
  }
}