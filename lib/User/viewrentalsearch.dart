import 'package:flutter/material.dart';
import 'package:loginrace/User/viewrentimage.dart';

class ViewRentalSearch extends StatefulWidget {
  const ViewRentalSearch({Key? key});

  @override
  State<ViewRentalSearch> createState() => _ViewRentalSearchState();
}

class _ViewRentalSearchState extends State<ViewRentalSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 147, 113, 233).withOpacity(0.8), 
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Rental Service',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Find what you want',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Select category'),
                    onChanged: (String? value) {},
                    items: <String>['Car', 'Bike', 'Other'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Select subcategory'),
                    onChanged: (String? value) {},
                    items: <String>['Aprila', 'Hero', 'Benz'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('Min price'),
                          onChanged: (String? value) {},
                          items: <String>['1', '2', '3'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text('Max price'),
                          onChanged: (String? value) {},
                          items: <String>['1', '2', '3'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RentImage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
