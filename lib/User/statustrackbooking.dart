import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatusTrack extends StatefulWidget {
    final VoidCallback? onComplete;

  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic level1;
  String uid;
   StatusTrack({super.key,this.onComplete, required this. name, required this.email, required this. phone, required this. uid, required this.level1, });

  @override
  State<StatusTrack> createState() => _StatusTrackState();
}

class _StatusTrackState extends State<StatusTrack> {
    String selectedStatus = 'Level 1'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'MY STATUS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                buildDetailRow('Name', widget.name ??'John Doe'),
                buildDetailRow('Email', widget.email ??'john.doe@example.com'),
                buildDetailRow('Phone Number',widget.phone ?? '+1234567890'),
               buildDetailRow('Payement', widget.level1 ??'399'),

                SizedBox(height: 20),
                // 
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text('Status: '),
                    DropdownButton<String>(
                      value: selectedStatus,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStatus = newValue!;
                        });
                      },
                      items: <String>['Level 1', 'Level 2']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child:  ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedStatus = 'Level 1';  
                });
                if (widget.onComplete != null) {
                  widget.onComplete!(); 
                }
              },
              child: Text('Complete'),
                  ),
                ),
              ],
            )
            ),
    );
            
          }
        
      
    
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
