import 'package:flutter/material.dart';

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
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  product.imagePath,
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  '${product.name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Description: ${product.description}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price: \$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Align(alignment: Alignment.centerRight,
                    
                    
                    )
                  ],
                ),
              ],
            ),
            
          
      );
        },
     ) );   
        }
  }




