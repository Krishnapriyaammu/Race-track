import 'package:flutter/material.dart';
import 'package:loginrace/Rental/uploadrentimage.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class ProductViewPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'YAMAHA RACE TRACK',
      description: 'Full face helmet',
      price: 19.99,
      imagePath: 'images/auto2.jfif',
    ),
    Product(
      name: 'YAMAHA RACE TRACK',
      description: 'Full face helmet.',
      price: 29.99,
      imagePath: 'images/auto2.jfif',
    ),
    Product(
      name: 'YAMAHA RACE TRACK',
      description: 'Full face helmet',
      price: 39.99,
      imagePath: 'images/auto2.jfif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
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
                decoration: BoxDecoration(color: const Color.fromARGB(255, 200, 225, 255),
                  image: DecorationImage(
                    image: AssetImage(product.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                '${product.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Description: ${product.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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
