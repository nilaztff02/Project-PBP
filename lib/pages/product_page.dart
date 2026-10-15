import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/booking.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  final String category;
  final List<Product> products;
  final List<Booking> bookingHistory;
  final ValueChanged<Booking> onBookingAdded;

  const ProductPage({
    super.key,
    required this.category,
    required this.products,
    required this.bookingHistory,
    required this.onBookingAdded,
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
              padding: const EdgeInsets.all(10),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,

                // Kartu cukup tinggi untuk foto dan informasi.
                childAspectRatio: 0.72,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  bookingHistory: bookingHistory,
                  onBooking: () {
                    final product = products[index];

                    onBookingAdded(
                      Booking(
                        productName: product.name,
                        price: product.price,
                        date: DateTime.now(),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${product.name} berhasil di-booking!',
                        ),
                        backgroundColor: Colors.pink,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}