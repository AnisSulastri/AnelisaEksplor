import 'package:anelisaeksplor/screens/login.dart';
import 'package:flutter/material.dart'; // Import halaman Login

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Menonaktifkan tampilan otomatis leading
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Tombol notifikasi
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Aksi untuk notifikasi
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar Profile
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/google.png'),
            ),
            const SizedBox(height: 16),

            // Nama Pengguna
            const Text(
              'Gais',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 32),

            // Menu Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menu List
                    MenuItem(title: 'Informasi Akun'),
                    MenuItem(title: 'Riwayat Perjalanan'),
                    MenuItem(title: 'Pengaturan Akun'),
                    const Divider(),

                    // Logout button
                    TextButton(
                      onPressed: () {
                        // Mengarahkan kembali ke halaman login saat logout
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Login(), // Halaman Login
                          ),
                        );
                      },
                      child: Text(
                        'Keluar',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk item menu
class MenuItem extends StatelessWidget {
  final String title;
  final Color? titleColor;

  const MenuItem({required this.title, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: titleColor ?? Colors.black,
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }
}
