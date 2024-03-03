 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginrace/User/rentuser.dart';

class RentImage extends StatefulWidget {
  const RentImage({super.key});

  @override
  State<RentImage> createState() => _RentImageState();
}

class _RentImageState extends State<RentImage>
    with SingleTickerProviderStateMixin {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return buildGridItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.blueGrey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RentUser();
                    }),
                  );
                },
                child: Image.asset(
                  'images/racing.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price-898',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle contact button press
                        // Add your contact logic here
                      },
                      child: Text('Contact'),
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.green, 
                         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Change the color as needed
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RentUser();
                          }),
                        );
                      },
                      child: Text('Rent'),
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),  // Change the color as needed
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}