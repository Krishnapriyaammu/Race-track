import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SlotDetails extends StatefulWidget {
  const SlotDetails({super.key});

  @override
  State<SlotDetails> createState() => _SlotDetailsState();
}

class _SlotDetailsState extends State<SlotDetails> {
  late LinkedHashMap<String, List<Map<String, dynamic>>> slotData;
  String selectedSlot = '';

  @override
  void initState() {
    super.initState();
    slotData = LinkedHashMap<String, List<Map<String, dynamic>>>();
    _fetchSlotData();
  }

  Future<void> _fetchSlotData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('user_race_track_booking').get();
      setState(() async {
        for (var doc in querySnapshot.docs) {
          String slotName = doc['selectedSlot'];
          String userId = doc['userid'];
          Map<String, dynamic> bookingData = {
            'time': doc['time'],
            'date': doc['date'],
          };

          // Fetch user details from user_register table based on user ID
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('user_register').doc(userId).get();
          if (userSnapshot.exists) {
            Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
            bookingData['name'] = userData['name'];
            bookingData['mobile'] = userData['mobile no'];
          } else {
            print('User data not found for user ID: $userId');
          }

          slotData[slotName] ??= [];
          slotData[slotName]!.add(bookingData);
        }

        // Print slotData for debugging
        print('slotData: $slotData');
      });
    } catch (e) {
      print('Error fetching slot data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Slot:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedSlot.isNotEmpty ? selectedSlot : null,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSlot = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Morning',
                  child: Text('Morning'),
                ),
                DropdownMenuItem(
                  value: 'Evening',
                  child: Text('Evening'),
                ),
                DropdownMenuItem(
                  value: 'Night',
                  child: Text('Night'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (selectedSlot.isNotEmpty && slotData != null && slotData[selectedSlot] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bookings for $selectedSlot:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  for (var bookingData in slotData[selectedSlot]!)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${bookingData['name']}'),
                        Text('Mobile: ${bookingData['mobile']}'),
                        Text('Time: ${bookingData['time']}'),
                        Text('Date: ${bookingData['date']}'),
                        Divider(),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}