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
              child: InkWell(onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentUser();
                  },));
              },
                child: Image.asset('images/racing.jpg'))
                
               
              ),
            ),
        ],
         ),
      );



    
  }
}