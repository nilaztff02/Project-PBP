import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/booking.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final List<Booking> bookingHistory;
  final VoidCallback onBooking;

  const ProductCard({
    super.key,
    required this.product,
    required this.bookingHistory,
    required this.onBooking,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // FOTO BUKET LEBIH PANJANG
          Expanded(
            flex: 7,
            child: Image.asset(
              product.image,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.pink.shade50,
                  child: const Icon(
                    Icons.local_florist,
                    size: 40,
                    color: Colors.pink,
                  ),
                );
              },
            ),
          ),

          // INFORMASI PRODUK
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 6, 7, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama buket
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Deskripsi tetap rapi
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        product.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 3),

                  // Harga
                  Text(
                    product.price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Tombol Booking
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onBooking,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        minimumSize: const Size(0, 28),
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Booking',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}