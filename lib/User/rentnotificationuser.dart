import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RentNotificationUser extends StatefulWidget {
  const RentNotificationUser({super.key});

  @override
  State<RentNotificationUser> createState() => _RentNotificationUserState();
}

class _RentNotificationUserState extends State<RentNotificationUser> {
 List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('user_rent_booking').get();

      List<Map<String, dynamic>> approachingDueDates = [];
      DateTime now = DateTime.now();
      int daysThreshold = 3;
      snapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        DateTime dueDate = DateTime.parse(data['due_date']);
        if (dueDate.isAfter(now) && dueDate.difference(now).inDays <= daysThreshold) {
          approachingDueDates.add(data);
        }
      });

      setState(() {
        notifications = approachingDueDates;
      });
    } catch (e) {
      print('Error fetching notifications: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> notification = notifications[index];
          return ListTile(
            title: Text('Due Date: ${notification['due_date']}'),
            subtitle: Text('Name: ${notification['name']}'),
            // Add more details as needed
          );
        },
      ),
    );
  }
}