import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginrace/User/viewindividualinstructor.dart';

class UserViewAllCoach extends StatefulWidget {
  const UserViewAllCoach({super.key});

  @override
  State<UserViewAllCoach> createState() => _UserViewAllCoachState();
}

class _UserViewAllCoachState extends State<UserViewAllCoach> {
    List<double> coachRatings = [4.5, 3.8, 5.0, 4.2, 3.5, 4.8, 4.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View all coaches'),
      ),
      body: ListView.builder(
        itemCount: coachRatings.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/imaaaa.jpg'),
            ),
            title: Text('Navaneeth Sheti'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: coachRatings[index],
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // Handle the rating update if needed
                        print(rating);
                      },
                    ),
                    SizedBox(width: 8),
                    Text('Rating: ${coachRatings[index].toString()}'),
                  ],
                ),
              ],
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewInstructor();
                }));
              },
              child: Icon(Icons.navigate_next),
            ),
          );
        },
      ),
    );
  }
}