import 'package:flutter/material.dart';

class RentalServicePage extends StatefulWidget {
  @override
  _RentalServicePageState createState() => _RentalServicePageState();
}

class Product {
  final String name;
  final String description;

  Product({
    required this.name,
    required this.description,
  });
}

class _RentalServicePageState extends State<RentalServicePage> {
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Service Products'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteProductDialog(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddProductDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showAddProductDialog() {
    String name = '';
    String description = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  products.add(Product(
                    name: name,
                    description: description,
                  ));
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteProductDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}







