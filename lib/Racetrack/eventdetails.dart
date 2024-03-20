import 'package:flutter/material.dart';

class EventDetaild extends StatefulWidget {
  const EventDetaild({super.key});

  @override
  State<EventDetaild> createState() => _EventDetaildState();
}

class _EventDetaildState extends State<EventDetaild> {
   TextEditingController dateController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController ticketDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Event Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'Enter event date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Event Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: eventNameController,
                decoration: InputDecoration(
                  hintText: 'Enter event name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ticket Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ticketDetailsController,
                decoration: InputDecoration(
                  hintText: 'Enter ticket details',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic here to save the entered details to Firestore or any other storage
                  // For example:
                  // saveEventTicket(dateController.text, eventNameController.text, ticketDetailsController.text);
                  Navigator.pop(context); // Navigate back to the previous page after saving
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}