import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Rental/rentalviewprofile.dart';
import 'package:loginrace/Rental/rentnotification.dart';
import 'package:loginrace/Rental/viewaccepatrequestrental.dart';
import 'package:loginrace/Rental/viewuseracceptreject.dart';

class RentalHome extends StatefulWidget {
  const RentalHome({super.key});

  @override
  State<RentalHome> createState() => _RentalHomeState();
}
class _RentalHomeState extends State<RentalHome> {
  

   Future<List<DocumentSnapshot>> getData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user_rent_booking')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; 
    }
  }
 
  

  final List<Tab> _tabs = [
    Tab(text: 'Requests'),
    Tab(text: 'Accepted'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rental Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.line_weight_outlined),
              onPressed: () {
                _showPopupMenu(context);
              },
            ),
          ],
          bottom: TabBar(
            tabs: _tabs,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.blue,
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            // Requests Tab
            _buildRequestsTab(),

            // Accepted Tab
            _buildAcceptedTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsTab() {
    return Expanded(
      child: FutureBuilder(
        future: getData(),
        builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
            itemCount: snapshot.data?.length ?? 0, // Replace with your actual data
            itemBuilder: (context, index) {
                final document = snapshot.data![index];
                final data = document.data() as Map<String, dynamic>;
                final imageUrl = data['image_url'];

              return InkWell(onTap: () {
                   Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewUserAccept();
                                
                            }));
              },
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 200, 225, 255),
                        
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: imageUrl != null
                            ? Image.network(imageUrl, fit: BoxFit.cover)
                            : Icon(Icons.image),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            data['name'] ?? 'Name not available',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            data['address'] ?? 'Address not available',
                            style: TextStyle(fontSize: 16),
                          ),
                           SizedBox(height: 8),
                          Text(
                            data['mobile no'] ?? 'Number not available',
                            style: TextStyle(fontSize: 16),
                          ),
                           SizedBox(height: 8),
                          Text(
                            data['due_date'] ?? 'Due date not available',
                            style: TextStyle(fontSize: 16),
                          ),
                           SizedBox(height: 8),
                          Text(
                            data['hours'] ?? 'Hours not available',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
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

       Future<List<DocumentSnapshot>> getdata() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user_rent_booking')
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }
        
      
    


  Widget _buildAcceptedTab() {
    // Replace this with the actual content of the Accepted tab
     return Expanded(
      child: FutureBuilder(
        future: getdata(),
        builder: (context,AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
            itemCount: snapshot.data?.length ?? 0, // Replace with your actual data
            itemBuilder: (context, index) {
                final document = snapshot.data![index];
                final data = document.data() as Map<String, dynamic>;
                final imageUrl = data['image_url'];

              return InkWell(onTap: () {
                   Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewUserAccept();
                                
                            }));
              },
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 200, 225, 255),
                        
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: imageUrl != null
                            ? Image.network(imageUrl, fit: BoxFit.cover)
                            : Icon(Icons.image),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            data['name'] ?? 'Name not available',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            data['address'] ?? 'Address not available',
                            style: TextStyle(fontSize: 16),
                          ),
                           SizedBox(height: 8),
                          Text(
                            data['mobile no'] ?? 'Number not available',
                            style: TextStyle(fontSize: 16),
                          ),
                           SizedBox(height: 8),
                          Text(
                            data['due_date'] ?? 'Due date not available',
                            style: TextStyle(fontSize: 16),
                          ),
                           SizedBox(height: 8),
                          Text(
                            data['hours'] ?? 'Hours not available',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    
                      ),
                    ),
              );
            }
            );
            }
        }
      )

         ) ;
           }
  
  void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, 80, 0, 0),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('View Profile'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentViewProfile();
                  },));
              // Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text('View Notifications'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RentNotification();
                  },));

              // Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout action
              Navigator.pop(context);
            },
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}