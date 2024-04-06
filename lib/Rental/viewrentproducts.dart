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
          .collection('rental_upload_image').where('rent_id',isEqualTo: a)
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
        future: _dataFuture,
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

                return ProductTile(
                  document: document,
                  imageUrl: imageUrl,
                  description: data['description'] ?? 'Description not available',
                  price: data['price'] ?? 'Price not available',
                  totalCount: data['total_count'] ?? 'Count not available',
                  onDelete: () {
                    // Handle delete action
                    // You can show a confirmation dialog and delete the product
                  },
                  onEdit: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return EditProductPage(document: document);
                      }),
                    );
                    setState(() {
                      // Refresh the data
                      _dataFuture = getData();
                    });
                  },
                );
              },
            );
          }
        },
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

class ProductTile extends StatelessWidget {
  final DocumentSnapshot document;
  final String imageUrl;
  final String description;
  final dynamic price;
  final dynamic totalCount;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ProductTile({
    required this.document,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.totalCount,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
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
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 200, 225, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: imageUrl != null ? Image.network(imageUrl, fit: BoxFit.cover) : Icon(Icons.image),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Price: $price', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Total Count: $totalCount', style: TextStyle(fontSize: 16)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
            IconButton(icon: Icon(Icons.edit), onPressed: onEdit),
          ],
        ),
      ),
    );
  }
}

class EditProductPage extends StatefulWidget {
  final DocumentSnapshot document;

  EditProductPage({required this.document});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _totalCountController;

  @override
  void initState() {
    super.initState();
    final data = widget.document.data() as Map<String, dynamic>;
    _descriptionController = TextEditingController(text: data['description']);
    _priceController = TextEditingController(text: data['price']?.toString() ?? '');
    _totalCountController = TextEditingController(text: data['total_count']?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Description')),
            TextField(controller: _priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
            TextField(controller: _totalCountController, decoration: InputDecoration(labelText: 'Total Count'), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newData = {
                    'description': _descriptionController.text,
                    'price': double.tryParse(_priceController.text) ?? 0,
                    'total_count': int.tryParse(_totalCountController.text) ?? 0,
                  };
                  await widget.document.reference.update(newData);
                  Navigator.pop(context);
                } catch (e) {
                  print('Error updating data: $e');
                  // Handle error updating data
                  // You can show a snackbar or dialog to inform the user about the error
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _priceController.dispose();
    _totalCountController.dispose();
    super.dispose();
  }
}