import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginrace/User/userviewfeedback.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({Key? key}) : super(key: key);

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  var feedback = TextEditingController();
    final _formKey = GlobalKey<FormState>();

  double _userRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rate your experience:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            RatingBar.builder(
              initialRating: _userRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _userRating = rating;
                });
              },
            ),
            SizedBox(height: 24),
            Text(
              'Additional Comments:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Expanded(
              child: TextFormField(
                controller: feedback,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comments';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your comments here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(feedback.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return FeedbackViewPage();
                      }));
                      print('Rating: $_userRating');
                    }
                  },
                  child: Text('Submit Feedback'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
