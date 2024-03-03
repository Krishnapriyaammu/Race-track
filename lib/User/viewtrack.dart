import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTrack extends StatefulWidget {
  const ViewTrack({super.key});

  @override
  State<ViewTrack> createState() => _ViewTrackState();
}

class _ViewTrackState extends State<ViewTrack> {
  @override


Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'OUR TRACK',
              style: GoogleFonts.getFont('Inter', fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16), 
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Image.asset('images/track.jpg'),
          ),
          Container(
            height: 30,
            width: 400,
            color: Color.fromARGB(255, 58, 57, 57),
            child: Text(
              'Grand Prix Circuit (2024-present)',
              style: GoogleFonts.getFont('Inter', fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          infoRow('Surface', 'Asphalt concrete with Graywacke aggregate'),
          infoRow('Length', '5.12 km (3.185 miles)'),
          infoRow('Turns', '16'),
          infoRow('Race lap record', '1:27.267 (Sebastian)'),
        ],
      ),
    ),
  );
}

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ),
  );
}
}