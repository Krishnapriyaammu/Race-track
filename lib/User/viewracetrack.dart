import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewRacetrack extends StatefulWidget {
  const ViewRacetrack({super.key});

  @override
  State<ViewRacetrack> createState() => _ViewRacetrackState();
}

class _ViewRacetrackState extends State<ViewRacetrack> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
     appBar: AppBar(
          
        ),
        body: 
      
    
  



     Column(
      children: [
       
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Left Container
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Adventurous race track'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text('car racing track'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('coimbatore, Tamilnadu'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Right Container
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: Container(
                            child: Image.asset('images/racing.jpg'),
                            // color: Colors.amber,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}

}
  
  
