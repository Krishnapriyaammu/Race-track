import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackItem {
  final String userImage;
  final String username;
  final double rating;
  final String feedback;

  FeedbackItem({
    required this.userImage,
    required this.username,
    required this.rating,
    required this.feedback,
  });
}

class FeedbackViewPage extends StatelessWidget {
  final List<FeedbackItem> feedbackList = [
    FeedbackItem(
      userImage: 'images/imaaaa.jpg',
      username: 'John Doe',
      rating: 4.5,
      feedback: 'Great experience with the track!',
    ),
    FeedbackItem(
      userImage: 'images/imaaaa.jpg',
      username: 'Jane Smith',
      rating: 3.0,
      feedback: 'Could use some improvements, but overall good.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback List'),
      ),
      body: ListView.builder(
        itemCount: feedbackList.length,
        itemBuilder: (context, index) {
          final feedbackItem = feedbackList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(feedbackItem.userImage),
                    radius: 30,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'User: ${feedbackItem.username}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  RatingBarIndicator(
                    rating: feedbackItem.rating,
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
                    'Feedback: ${feedbackItem.feedback}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



    