
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/autoshowaddpayementdetails.dart';

class UserRentViewStatus extends StatefulWidget {
  var img;
  var desc;
  var due_date;
  UserRentViewStatus({super.key, required this. img,   required this.desc,required this.due_date});

  @override
  State<UserRentViewStatus> createState() => _UserRentViewStatusState();
}

class _UserRentViewStatusState extends State<UserRentViewStatus> {

   Future<List<DocumentSnapshot>> getdata() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user_rent_booking')
          .get();
          
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
     
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: Text(
          'View Status',
          // style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FutureBuilder(
            future: getdata(),
            builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Add Container with Image
                  Container(
                     height: 130,
                    width: 130,
                    child: widget.img != null
                           ? Image.network(widget.img, fit: BoxFit.cover)
                           : Icon(Icons.image),
                  ),
                    
                  
                  SizedBox(height: 16),
                  Text(
                   widget.desc ?? 'name not available',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                   widget.due_date ?? 'name not available',
                  ),
                  SizedBox(height: 8),
                  // Text('Price: 4500/-'),
                 
                  SizedBox(height: 8),
                  Text('Status: APPROVED'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return AutoshowAddPayement();
                      },));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 77, 255, 122),
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    child: Text('Payement'),
                  ),
                ],
              );
            }
            }
          ),
        ),
      ),
    );
  }
}