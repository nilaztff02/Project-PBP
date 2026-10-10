import 'package:flutter/material.dart';

import '../widgets/profile_info_card.dart';
import '../widgets/profile_menu.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String phone;

  const ProfilePage({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FA),
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFFFE5EC),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.pink,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Pelanggan NZF.Store',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Akun',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ProfileInfoCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: email,
            ),

            ProfileInfoCard(
              icon: Icons.phone_outlined,
              title: 'Nomor HP',
              value: phone,
            ),

            const SizedBox(height: 20),

            ProfileMenu(
              icon: Icons.info_outline,
              title: 'Tentang NZF.Store',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Tentang NZF.Store'),
                      content: const Text(
                        'NZF.Store menyediakan berbagai '
                        'pilihan buket untuk wisuda, skripsi, '
                        'dan momen spesial lainnya.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            ProfileMenu(
              icon: Icons.logout,
              title: 'Keluar dari Akun',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}