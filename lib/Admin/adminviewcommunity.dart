import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Admin/acceptrejectcommunity.dart';

class AdminViewCommunity extends StatefulWidget {
  const AdminViewCommunity({super.key});

  @override
  State<AdminViewCommunity> createState() => _AdminViewCommunityState();
}

class _AdminViewCommunityState extends State<AdminViewCommunity> {
  Future<List<DocumentSnapshot>> getData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('community_register')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
          title: Text('Community List'),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
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

                return ListTile(
                  onTap: () {
                    
                  },
                   title: Text(data['name'] ?? 'Name not available'),
                      subtitle: Text(data['email'] ?? 'email  not available'),

                    leading: imageUrl != null

                ? CircleAvatar(
                                  backgroundImage: NetworkImage(imageUrl),
                            radius: 30,
                          )
                            : CircleAvatar(
                                  child: Icon(Icons.person),
                                  radius: 30,
                                ),    
                
                    trailing: InkWell(onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AdminAcceptRejectCommunity();
                  },));
                    },
                      child: Icon(Icons.navigate_next)));
                
              },
            );
          }
          }
        ),






    );
  }
}