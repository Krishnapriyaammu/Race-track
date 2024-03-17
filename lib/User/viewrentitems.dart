import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/User/viewrentalhome.dart';


class UserViewFullRenters extends StatelessWidget {


   Future<List<DocumentSnapshot>> getData() async {
  try {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('rental_add_service').get();
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
        title: Text('Rental service'),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [

                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        // onChanged: (query) => filterProfessionals(query),
                        decoration: InputDecoration(
                          hintText: 'Search your need',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                   {
                    return Center(child: CircularProgressIndicator());
                  } 
                  else if (snapshot.hasError) {

                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                   else
                    {
                    return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                         final document = snapshot.data![index];
                        final data =
                            document.data() as Map<String, dynamic>;
                             final imageUrl = data['image_url'];
                return ListTile(
                   onTap: () {},
                       title: Text(data['Renter Name'] ?? 'Name not available'),

                                    
                  subtitle: Text(data['Rental Service'] ?? 'service not available'),

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
                    onPressed: () {

                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserViewRentHome(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              backgroundColor: Color.fromARGB(255, 28, 43, 129),
                            ),
                            child: Text(
                              'AVAILABLE',
                              style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 231, 234, 236),
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
          ),

        ],
      ),
    );



  }
}
              
            
          
        
      
  
  



