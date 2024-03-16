import 'package:flutter/material.dart';
import 'package:loginrace/User/viewrentalhome.dart';
class Professional {
  final String name;
  final String experience;
  final bool isAvailable;

  Professional({
    required this.name,
    required this.experience,
    required this.isAvailable,
  });
}

class UserViewFullRenters extends StatelessWidget {
  final List<Professional> professionals = [
    Professional(
        name: 'John Doe', experience: 'Race bikes,Race cars,Helmet', isAvailable: true),
    Professional(name: 'Jane Smith', experience: 'Race grocery', isAvailable: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental service'),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [

                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        // onChanged: (query) => filterProfessionals(query),
                        decoration: InputDecoration(
                          hintText: 'Search your need',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                    itemCount: professionals.length,
                    itemBuilder: (context, index) {
                      final professional = professionals[index];
                      return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserViewRentHome();
                  },));
            },
            child: ListTile(
              leading: CircleAvatar(
                // You can use an Icon or an Image here
                child: Icon(Icons.person),
              ),
              title: Text(professional.name),
              subtitle: Text(professional.experience),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return professional.isAvailable
                          ? Colors.green
                          : Colors.red;
                    },
                  ),
                ),
                child: Text(
                  professional.isAvailable ? 'Available' : 'Not Available',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
                      );
                    },
                  ),
    ),
        ],
      ),
    );

  }
}


