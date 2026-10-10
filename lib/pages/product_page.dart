import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  final String category;
  final List<Product> products;

  const ProductPage({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FA),
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: products.isEmpty
          ? const Center(
              child: Text('Belum ada produk buket.'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.58,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            ),
    );
  }
}