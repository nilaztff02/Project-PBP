import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const BouquetApp());
}

class BouquetApp extends StatelessWidget {
  const BouquetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NZF.Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}