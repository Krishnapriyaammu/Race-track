import 'package:flutter/material.dart';
import 'package:loginrace/User/shiftsavailable.dart';

class SlotAvailability extends StatefulWidget {
  String rt_id;
  String level1;
   SlotAvailability({super.key, required this. rt_id, required this. level1});

  @override
  State<SlotAvailability> createState() => _SlotAvailabilityState();
}

class _SlotAvailabilityState extends State<SlotAvailability> {
   double _sliderValue = 3; // Initial value for the slider
  TimeOfDay _startTime = TimeOfDay.now(); // Initial start time

  @override
  Widget build(BuildContext context) {
    // Calculate the end time based on the start time and the selected number of hours
    TimeOfDay _endTime = _calculateEndTime(_startTime, _sliderValue.toInt());

    return Scaffold(
      appBar: AppBar(title: Text('Book Detail')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 5),
              onDateChanged: (date) {},
            ),
            ListTile(
              title: Text('Select Start Time'),
              subtitle: Text(_formatTime(_startTime)),
              onTap: () {
                _pickStartTime(context);
              },
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.yellow,
                thumbColor: Colors.yellow,
                overlayColor: Colors.yellow.withOpacity(0.7),
              ),
              child: Slider(
                value: _sliderValue,
                min: 1,
                max: 12,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value; // Update the slider value
                  });
                },
              ),
            ),
            Row(
              children: [
                Text('Start Hour: ${_formatTime(_startTime)}'),
                Spacer(),
                Text('End Hour: ${_formatTime(_endTime)}'),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              children: [
                Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('\$5.00/1 hour', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              children: [
                Text('Total Price', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('\$${(_sliderValue * 5).toStringAsFixed(2)}/${_sliderValue.toInt()} hours', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20), // Add some space between the rows and the button
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return ShiftAvailable(
                                            rt_id: widget.rt_id,
            totalPrice: (_sliderValue * 5).toStringAsFixed(2),
            totalHours: _sliderValue.toInt(),
            startTime: _startTime,
          );
        },
      ),
    );
  },
  child: Text('NEXT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to calculate the end time based on the start time and the number of hours
  TimeOfDay _calculateEndTime(TimeOfDay startTime, int hours) {
    int totalMinutes = startTime.hour * 60 + startTime.minute + (hours * 60);
    int endHour = totalMinutes ~/ 60;
    int endMinute = totalMinutes % 60;
    return TimeOfDay(hour: endHour, minute: endMinute);
  }

  // Method to format a TimeOfDay object as a string
  String _formatTime(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  // Method to pick the start time using a TimePicker
  Future<void> _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (pickedTime != null && pickedTime != _startTime) {
      setState(() {
        _startTime = pickedTime; // Update the selected start time
      });
    }
  }
}