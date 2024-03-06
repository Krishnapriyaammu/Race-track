import 'package:flutter/material.dart';
import 'package:loginrace/User/bookedsuccesfully.dart';
import 'package:loginrace/User/usertrackbooking.dart';
import 'package:loginrace/User/viewstatusinstructorbooking.dart';

class UserInstructorbooking extends StatefulWidget {
  const UserInstructorbooking({super.key});

  @override
  State<UserInstructorbooking> createState() => _UserInstructorbookingState();
}

class _UserInstructorbookingState extends State<UserInstructorbooking> {
    TextEditingController dateController = TextEditingController();
    var name=TextEditingController();
    var age=TextEditingController();
    var level=TextEditingController();
    var time=TextEditingController();
        final fkey = GlobalKey<FormState>();



    DateTime selectedDate = DateTime.now();
get suffixIcon => null;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime ? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.00),
          child: Form(
            key: fkey,
            child: Container(
              width: 400,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BE MY COACH',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(' Name'),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: name,
                        validator: (value) {
                           if (value!.isEmpty) {
                          return 'enter name';
                        }
                        },
                        decoration: InputDecoration(
                          hintText: ' Name',
                          fillColor: Color.fromARGB(112, 243, 214, 214),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Age'),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: age,
                        validator: (value) {
                           if (value!.isEmpty) {
                          return 'enter age';
                        }
                        },
                        decoration: InputDecoration(
                          hintText: 'Age',
                          fillColor: Color.fromARGB(112, 243, 214, 214),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Date'),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: "${selectedDate.toLocal()}".split(' ')[0],
                            ),
                            decoration: InputDecoration(
                              hintText: 'Date',
                              fillColor: Color.fromARGB(112, 243, 214, 214),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Time'),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: time,
                        validator: (value) {
                           if (value!.isEmpty) {
                          return 'enter time';
                        }
                        },
                        decoration: InputDecoration(
                          hintText: 'Time',
                          fillColor: Color.fromARGB(112, 243, 214, 214),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Level'),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: level,
                        validator: (value) {
                           if (value!.isEmpty) {
                          return 'enter level';
                        }
                        },
                        decoration: InputDecoration(
                          hintText: 'Level',
                          fillColor: Color.fromARGB(112, 243, 214, 214),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          print(name.text);
                          print(age.text);
                          print(dateController.text);
                          print(time.text);
                          print(level.text);
                          if (fkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return MyBookingsStatusPage();
                            }),
                          );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        child: Text('BOOK', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}