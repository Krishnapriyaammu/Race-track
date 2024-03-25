import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginrace/Rental/uploadrentimage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProductViewPage extends StatelessWidget {
  Future<List<DocumentSnapshot>> getData() async {
    try {

SharedPreferences sp = await SharedPreferences.getInstance();
                     var a = sp.getString('uid');


      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('rental_upload_image').where('uid',isEqualTo: a)
          .get();
      print('Fetched ${snapshot.docs.length} documents');
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }
    TextEditingController description = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
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
                    return Card(
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
                    decoration: BoxDecoration(color: Color.fromARGB(255, 200, 225, 255),
                      // image: DecorationImage(
                      //   // image: AssetImage(product.imagePath),
                      //   fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                      child: imageUrl != null
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : Icon(Icons.image),
                  ),
                  // title: Text(
                  //   '${product.name}',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          data['description'] ?? 'description not available',
                          style: TextStyle(fontSize: 16),
                        ),
                        // SizedBox(height: 8),
                        // Text(
                        //   data['Rental Service'] ?? 'Service not available',
                        //   style: TextStyle(fontSize: 16),
                        // ),
                      ],
                    ),
                   trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Handle delete action
                                // You can show a confirmation dialog and delete the product
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Handle edit action
                                // You can navigate to the edit page or show a dialog for editing
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return RentUploadImage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
