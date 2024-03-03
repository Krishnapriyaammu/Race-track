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
          color: Color.fromARGB(255, 182, 173, 239),
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
                onChanged: (String? value) {},
                items: <String>['Car', 'Bike', 'other'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                hint: Text('Sub category'),
                onChanged: (String? value) {},
                items: <String>['apprila', 'hero', 'benz'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      hint: Text('Min price'),
                      onChanged: (String? value) {},
                      items: <String>[' 1', ' 2', ' 3'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 60),
                  Expanded(
                    child: DropdownButton<String>(
                      hint: Text('Max price'),
                      onChanged: (String? value) {},
                      items: <String>['1', '2', ' 3'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentImage();
                  },));

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 72, 32, 152),
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