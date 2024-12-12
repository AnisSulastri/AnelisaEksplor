import 'package:anelisaeksplor/screens/pengaturan.dart';
import 'package:anelisaeksplor/screens/rekomendasiscreen.dart';
import 'package:anelisaeksplor/utils/const.dart';
import 'package:flutter/material.dart';

class NavDrawer {
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: gBackgroudColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Beranda',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.recommend,
                color: Colors.white,
              ),
              title: const Text(
                'Rekomendasi',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RekomendasiScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Pengaturan',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PengaturanScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
