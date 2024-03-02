import 'package:flutter/material.dart';

class RentNotification extends StatefulWidget {
  const RentNotification({super.key});

  @override
  State<RentNotification> createState() => _RentNotificationState();
}

class _RentNotificationState extends State<RentNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: NotificationView(),
      
    );
  }
}

class NotificationView extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Message',
      'description': 'You have a new message from John Doe.',
      'timestamp': DateTime.now(),
    },
    {
      'title': 'New Message',
      'description': 'You have a new message from John Doe.',
      'timestamp': DateTime.now(),
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              notification['title'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['description'],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  'Received on: ${notification['timestamp'].toLocal()}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },





    );
  }
}