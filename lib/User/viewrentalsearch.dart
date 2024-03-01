import 'package:flutter/material.dart';

class ViewRentalSearch extends StatefulWidget {
  const ViewRentalSearch({Key? key});

  @override
  State<ViewRentalSearch> createState() => _ViewRentalSearchState();
}

class _ViewRentalSearchState extends State<ViewRentalSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              child: Text(
                'Rental Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 56, 50, 45)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 500,
            width: 300,
            color: Color.fromARGB(255, 248, 163, 148),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Find what you want',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 27, 27, 27)),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  hint: Text('Add category'),
                  onChanged: (String? value) {
                    // Handle dropdown value change
                  },
                  items: <String>['A', 'B', 'C'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10,),
                 DropdownButton<String>(borderRadius: BorderRadius.circular(10),
                  hint: Text('Sub category'),
                  onChanged: (String? value) {
                    // Handle dropdown value change
                  },
                  items: <String>['A', 'B', 'C'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle search button press
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 236, 130, 130), // text color
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Search', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


