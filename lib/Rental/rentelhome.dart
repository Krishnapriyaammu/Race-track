import 'package:flutter/material.dart';
import 'package:loginrace/Rental/rentalviewprofile.dart';
import 'package:loginrace/Rental/rentnotification.dart';
import 'package:loginrace/Rental/viewaccepatrequestrental.dart';
import 'package:loginrace/Rental/viewuseracceptreject.dart';

class RentalHome extends StatefulWidget {
  const RentalHome({super.key});

  @override
  State<RentalHome> createState() => _RentalHomeState();
}
class _RentalHomeState extends State<RentalHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Home'),
        backgroundColor: Color.fromARGB(255, 235, 142, 148),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RentViewProfile();
                    }));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/imaaaa.jpg'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return NotificationView();
                    }));
                  },
                  child: Icon(Icons.notification_add, color: Colors.orange),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Request'),
                  ),
                  height: 50,
                  width: 140,
                  color: Color.fromARGB(255, 249, 126, 126),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewRentRequest();
                        }));
                      },
                      child: Text('Accepted'),
                    ),
                  ),
                  height: 50,
                  width: 138,
                  color: Color.fromARGB(255, 175, 72, 63),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 254, 199, 199),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ViewUserAccept();
                              }));
                            },
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('images/imaaaa.jpg'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Krishnapriya',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Chennai'),
                              Text('8129724516'),
                              Text('Rent date - 08/9/2020'),
                              Text('Due date - 10/9/2020'),
                            ],
                          ),
                        ],
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
