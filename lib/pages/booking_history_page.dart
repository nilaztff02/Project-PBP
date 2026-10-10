import 'package:flutter/material.dart';
import '../models/booking.dart';

class BookingHistoryPage extends StatelessWidget {
  final List<Booking> bookingHistory;

  const BookingHistoryPage({
    super.key,
    required this.bookingHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Booking'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: bookingHistory.isEmpty
          ? const Center(
              child: Text(
                'Belum ada riwayat booking.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: bookingHistory.length,
              itemBuilder: (context, index) {
                final booking = bookingHistory[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_florist,
                      color: Colors.pink,
                    ),
                    title: Text(booking.productName),
                    subtitle: Text(
                      'Harga: ${booking.price}\n'
                      'Tanggal: ${booking.date.day}/'
                      '${booking.date.month}/'
                      '${booking.date.year}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}