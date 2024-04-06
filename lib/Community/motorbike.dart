import 'package:flutter/material.dart';

class MotorBike extends StatefulWidget {
  const MotorBike({super.key, required String community_id});

  @override
  State<MotorBike> createState() => _MotorBikeState();
}

class _MotorBikeState extends State<MotorBike> {
   final List<String> motorImages = [
    'images/motor.jpg',
    'images/motor.jpg',
    'images/motor.jpg',
    // Add more vintage car image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Cars'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'SPORTS CARS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: motorImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        motorImages[index],
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Other SPORTS Car Images',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: motorImages.length,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    motorImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}