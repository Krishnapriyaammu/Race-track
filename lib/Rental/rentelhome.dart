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
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryButton('Request', Color.fromARGB(255, 221, 224, 231),),
              _buildCategoryButton('Accepted', Color.fromRGBO(147, 203, 237, 1),
                  onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewRentRequest();
                }));
              }),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ViewUserAccept();
                                }));
                  },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 200, 225, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('images/imaaaa.jpg'),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Krishnapriya',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Chennai'),
                                SizedBox(height: 4),
                                Text('8129724516'),
                                SizedBox(height: 4),
                                Text('Rent date - 08/9/2020'),
                                SizedBox(height: 4),
                                Text('Due date - 10/9/2020'),
                              ],
                            ),
                          ],
                        ),
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

  Widget _buildCategoryButton(String title, Color color, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}