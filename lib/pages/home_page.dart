import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/flower_decoration.dart';
import '../widgets/store_info_row.dart';
import 'product_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Buket Pita Satin Basic',
      'products': satinBasicProducts,
    },
    {
      'title': 'Buket Pita Satin Kriwil',
      'products': satinKriwilProducts,
    },
    {
      'title': 'Buket Bunga Artificial',
      'products': artificialProducts,
    },
    {
      'title': 'Buket Graduation',
      'products': graduationProducts,
    },
    {
      'title': 'Buket Skripsi',
      'products': skripsiProducts,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FA),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text(
          'NZF.Store 🌸',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFD6E4),
                    Color(0xFFFFEEF3),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const FlowerDecoration(size: 45),
                  const SizedBox(height: 8),
                  const Text(
                    'Buket Cantik untuk\nMomen Istimewa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pilih buket favoritmu dan booking sekarang!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Pilihan Buket 🌷',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            // DAFTAR KATEGORI
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                final products =
                    category['products'] as List<Product>;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFFFE5EC),
                      child: Icon(
                        Icons.local_florist,
                        color: Colors.pink,
                      ),
                    ),
                    title: Text(
                      category['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${products.length} pilihan buket',
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.pink,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            category: category['title'] as String,
                            products: products,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // INFORMASI TOKO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Toko 🌸',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const StoreInfoRow(
                    icon: Icons.location_on,
                    title: 'Alamat',
                    value: 'Panekan, Magetan, Jawa Timur 63353',
                  ),

                  const StoreInfoRow(
                    icon: Icons.phone,
                    title: 'Nomor Telepon',
                    value: '+62 813-5754-662',
                  ),

                  const StoreInfoRow(
                    icon: Icons.camera_alt,
                    title: 'Instagram',
                    value: '@bucketmurah.magetan',
                  ),

                  const StoreInfoRow(
                    icon: Icons.music_note,
                    title: 'TikTok',
                    value: '@bucketmurah.magetan',
                  ),

                  const StoreInfoRow(
                    icon: Icons.access_time,
                    title: 'Jam Buka',
                    value:
                        'Senin–Sabtu: 07.30–20.00\nMinggu: Tutup',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}