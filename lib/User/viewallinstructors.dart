import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginrace/User/viewindividualinstructor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewAllCoach extends StatefulWidget {
  String rt_id;
  UserViewAllCoach({super.key, required this.rt_id});
  

  @override
  State<UserViewAllCoach> createState() => _UserViewAllCoachState();
}

class _UserViewAllCoachState extends State<UserViewAllCoach> {
  Future<List<DocumentSnapshot>> getData() async {
    try {
      print('----------------------------${widget.rt_id}');

      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('race_track_add_coach').where('uid',isEqualTo: widget.rt_id)
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View all coaches'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
               final document = snapshot.data![index];
              final data = document.data() as Map<String, dynamic>;
              final imageUrl = data['image_url'];
              final desc = data['about'];
              final name = data['name'];
      
                return ListTile(
                  onTap: () {},
                  title: Text(data['name'] ?? 'Name not available'),
                  subtitle: SizedBox(
                    width: 5,
                    child: RatingBar.builder(
                      itemSize: 20,
                      initialRating: (data['rating'] ?? 0).toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        size: 3,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  leading: imageUrl != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                          radius: 30,
                        )
                      : CircleAvatar(
                          child: Icon(Icons.person),
                          radius: 30,
                        ),
                  trailing: ElevatedButton(
                    onPressed: () {print(imageUrl);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewInstructor(id:data['uid'],img:imageUrl,desc:desc,name:name),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      backgroundColor: Color.fromARGB(255, 28, 43, 129),
                    ),
                    child: Text(
                      'CHOOSE',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 231, 234, 236),
                        fontSize: 10,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
