

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';



class ProductCatalogue extends StatefulWidget {
  @override
  _ProductCatalogueState createState() => _ProductCatalogueState();
}

class _ProductCatalogueState extends State<ProductCatalogue> {
  // Simulate a list of products
  List<Map<String, dynamic>> products = List.generate(
    20,
        (index) => {
      'id': index,
      'image': 'https://via.placeholder.com/150', // Placeholder image
      'title': 'Product $index',
      'price': '\$${(index + 1) * 10}',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalogue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = (constraints.maxWidth > 600) ? 3 : 2;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.product['id'].toString()),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true; // Load the widget when visible
          });
        }
      },
      child: Card(
        elevation: 4,
        child: _isVisible
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.product['image'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              widget.product['title'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.product['price'],
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add to cart action
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${widget.product['title']} added to cart!'),
                ));
              },
              child: Text('Add to Cart'),
            ),
          ],
        )
            : Center(
          child: CircularProgressIndicator(), // Show loading indicator while not visible
        ),
      ),
    );
  }
}
