
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginrace/Racetrack/trackdetails.dart';

class RaceTrackItem {
  final String name;
  final String image;
  final double rating;
  final String state;

  RaceTrackItem({
    required this.name,
    required this.image,
    required this.rating,
    required this.state,
  });
}

class RaceTrackViewPage extends StatelessWidget {
  final List<RaceTrackItem> raceTrackList = [
    RaceTrackItem(
      name: 'Speedy Circuit',
      image: 'images/racing.jpg',
      rating: 4.5,
      state: 'California',
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Race Track List'),
      ),
      body: ListView.builder(
        itemCount: raceTrackList.length,
        itemBuilder: (context, index) {
          final raceTrack = raceTrackList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      raceTrack.image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      raceTrack.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    RatingBarIndicator(
                      rating: raceTrack.rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'State: ${raceTrack.state}',
                      style: TextStyle(fontSize: 16),
                    ),
                       IconButton(
                          icon: Icon(Icons.arrow_forward,),
                          
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TrackDetails();
            }));
                          },
                    ),Text('Add more..')
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


