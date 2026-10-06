import 'package:flutter/material.dart';

void main() {
  runApp(const BouquetApp());
}

// ============================================================
// APLIKASI
// ============================================================

class BouquetApp extends StatelessWidget {
  const BouquetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NZF.Store',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFFF8FA),
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.light,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// DATA BOOKING
// ============================================================

final List<Booking> bookingHistory = [];

class Booking {
  final String productName;
  final String price;
  final DateTime date;

  Booking({
    required this.productName,
    required this.price,
    required this.date,
  });
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool hidePassword = true;

  void login() {
    if (emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Email, nomor HP, dan password harus diisi!',
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainNavigation(
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // ==================================================
                // LOGO
                // ==================================================

                Image.asset(
                  'assets/images/Logo buket.jpeg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {
                    return const Icon(
                      Icons.local_florist,
                      size: 120,
                      color: Colors.pink,
                    );
                  },
                ),

                const SizedBox(height: 20),

                const Text(
                  'NZF.Store',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Pesan buket impianmu, untuk setiap momen spesial 🌷',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 35),

                // ==================================================
                // EMAIL
                // ==================================================

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // ==================================================
                // NOMOR HP
                // ==================================================

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'No. HP',
                    hintText: 'Contoh: 081234567890',
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // ==================================================
                // PASSWORD
                // ==================================================

                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.pink,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // ==================================================
                // LOGIN
                // ==================================================

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'NZF.Store 💗',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

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

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        email: widget.email,
        phone: widget.phone,
      ),
      const BookingHistoryPage(),
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
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Riwayat Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil Saya',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  final String email;
  final String phone;

  const HomePage({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NZF.Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==================================================
            // HEADER
            // ==================================================

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    28,
                    24,
                    35,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF8FB1),
                        Color(0xFFFFD6E2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello, Beautiful! 🌷',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Temukan buket cantik untuk orang tersayang 💐',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 18),

                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const Positioned(
                  right: 15,
                  top: 12,
                  child: FlowerDecoration(
                    icon: Icons.local_florist,
                    size: 55,
                  ),
                ),

                const Positioned(
                  right: 80,
                  bottom: 8,
                  child: FlowerDecoration(
                    icon: Icons.spa,
                    size: 40,
                  ),
                ),

                const Positioned(
                  left: -5,
                  bottom: -10,
                  child: FlowerDecoration(
                    icon: Icons.local_florist,
                    size: 45,
                  ),
                ),
              ],
            ),

            // ==================================================
            // ISI HOME
            // ==================================================

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // ==================================================
                  // INFO TOKO
                  // ==================================================

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withValues(
                            alpha: 0.10,
                          ),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: const Color(0xFFFFD1DC),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFFFE5EC),
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.storefront,
                                color: Colors.pink,
                                size: 25,
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Text(
                              'Info Toko Kami',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        const StoreInfoRow(
                          icon:
                              Icons.location_on_outlined,
                          title: 'Alamat',
                          value:
                              'Panekan, Magetan, Jawa Timur 63353',
                        ),

                        const SizedBox(height: 14),

                        const StoreInfoRow(
                          icon: Icons.phone_outlined,
                          title: 'No. HP',
                          value: '+62 813-5754-662',
                        ),

                        const SizedBox(height: 14),

                        const StoreInfoRow(
                          icon:
                              Icons.camera_alt_outlined,
                          title: 'Instagram',
                          value:
                              '@bucketmurah.magetan',
                        ),

                        const SizedBox(height: 14),

                        const StoreInfoRow(
                          icon: Icons.music_note_outlined,
                          title: 'TikTok',
                          value:
                              '@bucketmurah.magetan',
                        ),

                        const SizedBox(height: 14),

                        const StoreInfoRow(
                          icon:
                              Icons.access_time_outlined,
                          title: 'Jam Buka',
                          value:
                              'Senin - Sabtu | 07.30 - 20.00\nMinggu | Libur',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // PILIH JENIS BUKET
                  // ==================================================

                  const Text(
                    'Pilih Jenis Buket',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ==================================================
                  // SATIN BASIC
                  // ==================================================

                  CategoryCard(
                    title: 'Buket Pita Satin Basic',
                    subtitle:
                        'Buket pita satin basic yang cantik',
                    icon: Icons.card_giftcard,
                    color:
                        const Color(0xFFFFD1DC),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProductPage(
                            category:
                                'Buket Pita Satin Basic',
                            products:
                                satinBasicProducts,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // ==================================================
                  // SATIN KRIWIL
                  // ==================================================

                  CategoryCard(
                    title: 'Buket Pita Satin Kriwil',
                    subtitle:
                        'Buket pita satin model kriwil',
                    icon: Icons.auto_awesome,
                    color:
                        const Color(0xFFFFC6D9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProductPage(
                            category:
                                'Buket Pita Satin Kriwil',
                            products:
                                satinKriwilProducts,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // ==================================================
                  // ARTIFICIAL
                  // ==================================================

                  CategoryCard(
                    title: 'Buket Bunga Artificial',
                    subtitle:
                        'Bunga artificial cantik yang tahan lama',
                    icon: Icons.local_florist,
                    color:
                        const Color(0xFFE8D5F5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProductPage(
                            category:
                                'Buket Bunga Artificial',
                            products:
                                artificialProducts,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // ==================================================
                  // GRADUATION
                  // ==================================================

                  CategoryCard(
                    title: 'Buket Graduation',
                    subtitle:
                        'Buket spesial untuk hari wisuda',
                    icon: Icons.school,
                    color:
                        const Color(0xFFD5E8FF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProductPage(
                            category:
                                'Buket Graduation',
                            products:
                                graduationProducts,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // ==================================================
                  // SKRIPSI
                  // ==================================================

                  CategoryCard(
                    title: 'Buket Skripsi',
                    subtitle:
                        'Buket spesial untuk teman yang selesai skripsi',
                    icon: Icons.menu_book,
                    color:
                        const Color(0xFFFFE0B2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProductPage(
                            category:
                                'Buket Skripsi',
                            products:
                                skripsiProducts,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // PENUTUP
                  // ==================================================

                  Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.local_florist,
                          color: Colors.pink,
                          size: 30,
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Temukan buket cantik untuk setiap momen spesial 💐',
                          textAlign:
                              TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'Terima kasih telah memilih NZF.Store 💗',
                          textAlign:
                              TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                FontWeight.w600,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HIASAN BUNGA
// ============================================================

class FlowerDecoration
    extends StatelessWidget {
  final IconData icon;
  final double size;

  const FlowerDecoration({
    super.key,
    required this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: 0.22,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: size * 0.60,
        color: Colors.white.withValues(
          alpha: 0.90,
        ),
      ),
    );
  }
}

// ============================================================
// STORE INFO ROW
// ============================================================

class StoreInfoRow
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StoreInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                const Color(0xFFFFF0F4),
            borderRadius:
                BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.pink,
            size: 21,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CATEGORY CARD
// ============================================================

class CategoryCard
    extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color:
                    Colors.white.withValues(
                  alpha: 0.75,
                ),
                borderRadius:
                    BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Colors.pink,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// RIWAYAT BOOKING
// ============================================================

class BookingHistoryPage
    extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Booking',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: bookingHistory.isEmpty
          ? Center(
              child: Padding(
                padding:
                    const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.all(25),
                      decoration:
                          const BoxDecoration(
                        color:
                            Color(0xFFFFE5EC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons
                            .receipt_long_outlined,
                        size: 65,
                        color: Colors.pink,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Belum Ada Booking',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Booking buket pilihanmu, lalu riwayatnya akan muncul di sini.',
                      textAlign:
                          TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(16),
              itemCount:
                  bookingHistory.length,
              itemBuilder:
                  (context, index) {
                final booking =
                    bookingHistory[index];

                return Container(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),
                  padding:
                      const EdgeInsets.all(16),
                  decoration:
                      BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(18),
                    border: Border.all(
                      color:
                          const Color(0xFFFFD1DC),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.all(13),
                        decoration:
                            BoxDecoration(
                          color:
                              const Color(0xFFFFE5EC),
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.local_florist,
                          color: Colors.pink,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.productName,
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              booking.price,
                              style:
                                  const TextStyle(
                                color: Colors.pink,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              'Booking: ${booking.date.day}/${booking.date.month}/${booking.date.year}',
                              style:
                                  const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration:
                            BoxDecoration(
                          color:
                              const Color(0xFFFFE5EC),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Diproses',
                          style:
                              TextStyle(
                            color: Colors.pink,
                            fontSize: 11,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

// ============================================================
// PROFILE PAGE
// ============================================================

class ProfilePage
    extends StatelessWidget {
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
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ==================================================
            // FOTO PROFIL
            // ==================================================

            const CircleAvatar(
              radius: 65,
              backgroundColor:
                  Color(0xFFFFE5EC),
              backgroundImage:
                  AssetImage(
                'assets/images/Logo buket.jpeg',
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'NZF Store',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Pelanggan NZF.Store',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            ProfileInfoCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: email,
            ),

            const SizedBox(height: 12),

            ProfileInfoCard(
              icon: Icons.phone_outlined,
              title: 'No. HP',
              value: phone,
            ),

            const SizedBox(height: 12),

            const ProfileInfoCard(
              icon:
                  Icons.location_on_outlined,
              title: 'Alamat Toko',
              value:
                  'Panekan, Magetan, Jawa Timur 63353',
            ),

            const SizedBox(height: 25),

            // ==================================================
            // EDIT PROFIL
            // ==================================================

            ProfileMenu(
              icon: Icons.edit_outlined,
              title: 'Edit Profil',
              subtitle:
                  'Ubah informasi profil',
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur Edit Profil akan segera tersedia',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // ==================================================
            // FAVORIT
            // ==================================================

            ProfileMenu(
              icon:
                  Icons.favorite_border,
              title: 'Produk Favorit',
              subtitle:
                  'Lihat produk favorit kamu',
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Belum ada produk favorit',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // ==================================================
            // RIWAYAT
            // ==================================================

            ProfileMenu(
              icon:
                  Icons.receipt_long_outlined,
              title: 'Riwayat Booking',
              subtitle:
                  'Lihat semua booking buket',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const BookingHistoryPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // ==================================================
            // PENGATURAN
            // ==================================================

            ProfileMenu(
              icon:
                  Icons.settings_outlined,
              title: 'Pengaturan',
              subtitle:
                  'Pengaturan aplikasi',
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Pengaturan aplikasi',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // ==================================================
            // LOGOUT
            // ==================================================

            ProfileMenu(
              icon: Icons.logout,
              title: 'Logout',
              subtitle:
                  'Keluar dari akun',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginPage(),
                  ),
                  (route) => false,
                );
              },
            ),

            const SizedBox(height: 25),

            const Text(
              'NZF.Store 💗',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PROFILE INFO CARD
// ============================================================

class ProfileInfoCard
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(
              alpha: 0.15,
            ),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  const Color(0xFFFFE5EC),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.pink,
              size: 25,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE MENU
// ============================================================

class ProfileMenu
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(15),
      child: Container(
        padding:
            const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(15),
          border: Border.all(
            color:
                const Color(0xFFFFD1DC),
          ),
        ),

        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFFFE5EC),
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.pink,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        const TextStyle(
                      fontSize: 15,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style:
                        const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT PAGE
// ============================================================

class ProductPage
    extends StatelessWidget {
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
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(8),

        // ==================================================
        // 3 KOTAK DALAM 1 BARIS
        // ==================================================

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,

          // Membuat kartu lebih kecil
          childAspectRatio: 0.72,
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

// ============================================================
// PRODUCT CARD
// ============================================================

class ProductCard
    extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  void booking(BuildContext context) {
    bookingHistory.insert(
      0,
      Booking(
        productName: product.name,
        price: product.price,
        date: DateTime.now(),
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} berhasil dibooking!',
        ),
        action: SnackBarAction(
          label: 'LIHAT',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const BookingHistoryPage(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12),
      ),

      child: Padding(
        padding:
            const EdgeInsets.all(5),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // ==================================================
            // GAMBAR
            // ==================================================

            Expanded(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(9),

                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      color:
                          const Color(0xFFFFE5EC),
                      child: const Center(
                        child: Icon(
                          Icons
                              .image_not_supported,
                          color: Colors.pink,
                          size: 25,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 5),

            // ==================================================
            // NAMA
            // ==================================================

            Text(
              product.name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 2),

            // ==================================================
            // DESKRIPSI
            // ==================================================

            Text(
              product.description,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 2),

            // ==================================================
            // HARGA
            // ==================================================

            Text(
              product.price,
              style: const TextStyle(
                fontSize: 11,
                fontWeight:
                    FontWeight.bold,
                color: Colors.pink,
              ),
            ),

            const SizedBox(height: 4),

            // ==================================================
            // BOOKING
            // ==================================================

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  booking(context);
                },

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.pink,
                  foregroundColor:
                      Colors.white,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 6,
                  ),

                  minimumSize:
                      const Size(0, 28),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(7),
                  ),
                ),

                child: const Text(
                  'BOOKING',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT MODEL
// ============================================================

class Product {
  final String name;
  final String description;
  final String price;
  final String image;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

// ============================================================
// SATIN BASIC PRODUCTS
// ============================================================

const List<Product>
    satinBasicProducts = [
  Product(
    name: 'Satin Basic 1',
    description:
        'Buket pita satin basic',
    price: 'Rp80.000',
    image:
        'assets/images/Satin biasa1.jpeg',
  ),

  Product(
    name: 'Satin Basic 2',
    description:
        'Buket pita satin elegan',
    price: 'Rp85.000',
    image:
        'assets/images/Satin Biasa2.jpeg',
  ),

  Product(
    name: 'Satin Basic 3',
    description:
        'Buket pita satin basic',
    price: 'Rp90.000',
    image:
        'assets/images/Satin biasa3.jpeg',
  ),

  Product(
    name: 'Satin Basic 4',
    description:
        'Buket pita satin basic',
    price: 'Rp95.000',
    image:
        'assets/images/Satin biasa4.jpeg',
  ),

  Product(
    name: 'Satin Basic 5',
    description:
        'Buket pita satin basic',
    price: 'Rp100.000',
    image:
        'assets/images/Satin biasa5.jpeg',
  ),
];

// ============================================================
// SATIN KRIWIL PRODUCTS
// ============================================================

const List<Product>
    satinKriwilProducts = [
  Product(
    name: 'Satin Kriwil 1',
    description:
        'Buket satin model kriwil',
    price: 'Rp90.000',
    image:
        'assets/images/Satin kriwil1.jpeg',
  ),

  Product(
    name: 'Satin Kriwil 2',
    description:
        'Buket satin kriwil premium',
    price: 'Rp150.000',
    image:
        'assets/images/Satin kriwil2.jpeg',
  ),

  Product(
    name: 'Satin Kriwil 3',
    description:
        'Buket satin model kriwil',
    price: 'Rp100.000',
    image:
        'assets/images/Satin kriwil3.jpeg',
  ),

  Product(
    name: 'Satin Kriwil 4',
    description:
        'Buket satin model kriwil',
    price: 'Rp110.000',
    image:
        'assets/images/Satin kriwil4.jpeg',
  ),

  Product(
    name: 'Satin Kriwil 5',
    description:
        'Buket satin kriwil premium',
    price: 'Rp120.000',
    image:
        'assets/images/Satin kriwil5.jpeg',
  ),
];

// ============================================================
// ARTIFICIAL PRODUCTS
// ============================================================

const List<Product>
    artificialProducts = [
  Product(
    name: 'Artificial Flower 1',
    description:
        'Buket bunga artificial',
    price: 'Rp75.000',
    image:
        'assets/images/Artificial_1.jpeg',
  ),

  Product(
    name: 'Artificial Flower 2',
    description:
        'Bunga artificial elegan',
    price: 'Rp90.000',
    image:
        'assets/images/Artificial_2.jpeg',
  ),

  Product(
    name: 'Artificial Flower 3',
    description:
        'Buket bunga warna pastel',
    price: 'Rp120.000',
    image:
        'assets/images/Artificial_3.jpeg',
  ),

  Product(
    name: 'Artificial Flower 4',
    description:
        'Buket bunga premium',
    price: 'Rp150.000',
    image:
        'assets/images/Artificial_4.jpeg',
  ),

  Product(
    name: 'Artificial Flower 5',
    description:
        'Buket bunga artificial cantik',
    price: 'Rp160.000',
    image:
        'assets/images/Artificial_5.jpeg',
  ),
];

// ============================================================
// GRADUATION PRODUCTS
// ============================================================

const List<Product>
    graduationProducts = [
  Product(
    name: 'Graduation Bouquet 1',
    description:
        'Buket wisuda sederhana',
    price: 'Rp60.000',
    image:
        'assets/images/Graduation_1.jpeg',
  ),

  Product(
    name: 'Graduation Bouquet 2',
    description:
        'Buket wisuda dengan boneka',
    price: 'Rp85.000',
    image:
        'assets/images/Graduation_2.jpeg',
  ),

  Product(
    name: 'Graduation Bouquet 3',
    description:
        'Buket wisuda premium',
    price: 'Rp110.000',
    image:
        'assets/images/Graduation_3.jpeg',
  ),

  Product(
    name: 'Graduation Bouquet 4',
    description:
        'Buket wisuda custom',
    price: 'Rp150.000',
    image:
        'assets/images/Graduation_4.jpeg',
  ),
];

// ============================================================
// SKRIPSI PRODUCTS
// ============================================================

const List<Product>
    skripsiProducts = [
  Product(
    name: 'Buket Skripsi 1',
    description:
        'Buket spesial untuk teman yang selesai skripsi',
    price: 'Rp75.000',
    image:
        'assets/images/buket skripsi 1.jpeg',
  ),
];