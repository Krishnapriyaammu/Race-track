import 'package:flutter/material.dart';
import 'package:loginrace/Rental/viewaccepatrequestrental.dart';

class ViewUserAccept extends StatefulWidget {
  const ViewUserAccept({super.key});

  @override
  State<ViewUserAccept> createState() => _ViewUserAcceptState();
}

class _ViewUserAcceptState extends State<ViewUserAccept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
        // title: Text('Re'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(8)),
          height: 600,width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                 Center(
                   child: CircleAvatar(
                    backgroundImage: AssetImage('images/imaaaa.jpg'),
                    radius: 30,
                                   ),
                 ),
                 Center(
                  child: Column(
                    children: [
                      Text('Krishnapriya'),
                    ],
                  ),
                ),
              
             SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Chennai',
                  style: TextStyle(fontSize: 18),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  '812972416',
                  style: TextStyle(fontSize: 18),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Rent price: \$80',
                  style: TextStyle(fontSize: 18),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 40),
                 child: Text(
                  'Rent date: 08/9/2024',
                  style: TextStyle(fontSize: 18),
                               ),
               ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Due date: 2/10/2024',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Model year: 2011',
                  style: TextStyle(fontSize: 18),
                ),
              ),
                SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Image.asset('images/auto2.jfif'),
              ),
              // Accept and Reject Buttons
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ViewRentRequest();
                  },));
                    },
                    child: Text('Accept'),
                  ),
                   ElevatedButton(
                    onPressed: () {
                      // Handle Reject action
                    },
                    child: Text('Reject'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],),
            ],
        ),
          ),
        ),
    );
      






    
  }
}