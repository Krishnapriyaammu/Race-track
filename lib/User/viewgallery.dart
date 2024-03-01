import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewGallery extends StatefulWidget {
  const ViewGallery({super.key});

  @override
  State<ViewGallery> createState() => _ViewGalleryState();
}

class _ViewGalleryState extends State<ViewGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(),



body: Padding(
  padding: const EdgeInsets.only(left: 80),
  child: Column(
    // mainAxisAlignment: MainAxisAlignment.center,
           
           children: [
  
      Text('RACR GALLERY',style: GoogleFonts.getFont('Josefin Sans',fontSize: 30,),)
  
  ],),
),
    );
  }
}