import 'package:flutter/material.dart';

import '../models/booking.dart';
import 'home_page.dart';
import 'booking_history_page.dart';
import 'profile_page.dart';

class MainNavigation extends StatefulWidget {
  final String email;
  final String phone;

  const MainNavigation({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Booking> bookingHistory = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      BookingHistoryPage(
        bookingHistory: bookingHistory,
      ),
      ProfilePage(
        email: widget.email,
        phone: widget.phone,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Riwayat Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil Saya',
          ),
        ],
      ),
    );
  }
}