// import 'package:flutter/material.dart';

// class CommunityViewDetails extends StatefulWidget {
//   const CommunityViewDetails({super.key});

//   @override
//   State<CommunityViewDetails> createState() => _CommunityViewDetailsState();
// }

// class _CommunityViewDetailsState extends State<CommunityViewDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
 




// class Vehicle {
//   final String name;
//   final String type;
//   final String imageUrl;
//   int likes;
//   List<String> comments;

//   Vehicle({
//     required this.name,
//     required this.type,
//     required this.imageUrl,
//     this.likes = 0,
//     this.comments = const [],
//   });
// }

// class VehicleShowcase extends StatefulWidget {
//   @override
//   _VehicleShowcaseState createState() => _VehicleShowcaseState();
// }

// class _VehicleShowcaseState extends State<VehicleShowcase> {
//   List<Vehicle> vehicles = [
//     Vehicle(name: 'Superbike 1000X', type: 'Bike', imageUrl: 'images/bike1.jpg'),
//     Vehicle(name: 'Luxury Sedan', type: 'Car', imageUrl: 'images/car1.jpg'),
//     // Add more vehicles as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bike & Car Show'),
//       ),
//       body: ListView.builder(
//         itemCount: vehicles.length,
//         itemBuilder: (context, index) {
//           return VehicleCard(vehicle: vehicles[index]);
//         },
//       ),
//     );
//   }
// }

// class VehicleCard extends StatelessWidget {
//   final Vehicle vehicle;

//   VehicleCard({required this.vehicle});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             vehicle.imageUrl,
//             width: double.infinity,
//             height: 200,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   vehicle.name,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text(vehicle.type),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.thumb_up),
//                       onPressed: () {
//                         // Increase likes
//                         // You might want to implement user authentication to prevent duplicate likes
//                         setState(() {
//                           vehicle.likes++;
//                         });
//                       },
//                     ),
//                     Text('${vehicle.likes} Likes'),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 // Add comments functionality here
//                 // You can use a ListView.builder for comments
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VehicleShowcase(),
//     );
//   }
// }
