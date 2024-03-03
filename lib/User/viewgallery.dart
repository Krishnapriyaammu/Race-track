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
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'RACR GALLERY',
                style: GoogleFonts.getFont(
                  'Josefin Sans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                  return buildGridItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.blueGrey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset('images/racing.jpg')
                
               
              ),
            ),
        ],
         ),
      );
      
  
    
  }
}