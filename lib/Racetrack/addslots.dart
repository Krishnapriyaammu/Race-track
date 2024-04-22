import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSlots extends StatefulWidget {
  const AddSlots({super.key, });

  @override
  State<AddSlots> createState() => _AddSlotsState();
}

class _AddSlotsState extends State<AddSlots> {
   int morningCount = 0;
  int eveningCount = 0;
  int nightCount = 0;
  late DateTime selectedDate;

  TextEditingController morningController = TextEditingController();
  TextEditingController eveningController = TextEditingController();
  TextEditingController nightController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now().add(Duration(days: 1)); // Initialize with tomorrow's date
    _loadSavedSlots();
    morningController.addListener(updateMorningCount);
    eveningController.addListener(updateEveningCount);
    nightController.addListener(updateNightCount);
  }

  @override
  void dispose() {
    morningController.dispose();
    eveningController.dispose();
    nightController.dispose();
    super.dispose();
  }

  void updateMorningCount() {
    setState(() {
      morningCount = int.tryParse(morningController.text) ?? 0;
    });
  }

  void updateEveningCount() {
    setState(() {
      eveningCount = int.tryParse(eveningController.text) ?? 0;
    });
  }

  void updateNightCount() {
    setState(() {
      nightCount = int.tryParse(nightController.text) ?? 0;
    });
  }

  Future<void> _loadSavedSlots() async {
    try {
      final snapshot = await firestore
          .collection('slots')
          .where('selectedDate', isEqualTo: selectedDate)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        setState(() {
          morningCount = data['morningCount'] ?? 0;
          eveningCount = data['eveningCount'] ?? 0;
          nightCount = data['nightCount'] ?? 0;
          morningController.text = morningCount.toString();
          eveningController.text = eveningCount.toString();
          nightController.text = nightCount.toString();
        });
      } else {
        setState(() {
          morningCount = 0;
          eveningCount = 0;
          nightCount = 0;
          morningController.clear();
          eveningController.clear();
          nightController.clear();
        });
      }
    } catch (e) {
      print('Error loading saved slots: $e');
    }
  }

 Future<void> _saveSlots() async {
  try {
      final formattedDate = '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
    final docRef = firestore.collection('slots').doc(formattedDate);

    await docRef.set({
      'docId': formattedDate,
      'morningCount': morningCount,
      'eveningCount': eveningCount,
      'nightCount': nightCount,
      
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Slots saved successfully!'),
    ));
    _loadSavedSlots();
  } catch (e) {
    print('Error saving slots: $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error saving slots: $e'),
    ));
  }
}

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      _loadSavedSlots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Slots'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Column(
                children: [
                  Text(
                    'Selected Date',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Morning Slots',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: morningController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Count',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Evening Slots',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: eveningController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Count',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Night Slots',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: nightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Count',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveSlots,
                child: Text('Save Slots'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}