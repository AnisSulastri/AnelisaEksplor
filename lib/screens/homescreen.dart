import 'package:anelisaeksplor/screens/pengaturan.dart';
import 'package:anelisaeksplor/screens/rekomendasiscreen.dart';
import 'package:anelisaeksplor/screens/ulasanscreen.dart';
import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/jelajahscreen.dart';
import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/screens/detailwisata.dart';
import 'package:anelisaeksplor/widgets/populer.dart';
import 'package:anelisaeksplor/widgets/other.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TravelDestination> popular = listDestination
      .where((element) => element.category == 'popular')
      .toList();
  final List<TravelDestination> other =
      listDestination.where((element) => element.category == 'other').toList();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Hi, ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const TextSpan(
                  text: 'Gais',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                TextSpan(
                  text: '\nExplore now',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.green[900]),
                ),
              ],
            ),
          ),
        ),
        endDrawer: _buildDrawer(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(),
                _buildPopularPlacesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 20.0), // Jarak atas

            // Item Beranda
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
                size: 30.0, // Ukuran ikon lebih besar
              ),
              title: const Text(
                'Beranda',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Item Rekomendasi
            ListTile(
              leading: const Icon(
                Icons.recommend,
                color: Colors.white,
                size: 30.0, // Ukuran ikon lebih besar
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

            // Item Ulasan
            ListTile(
              leading: const Icon(
                Icons.star_rate_rounded,
                color: Colors.white,
                size: 30.0, // Ukuran ikon lebih besar
              ),
              title: const Text(
                'Ulasan',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UlasanScreen(),
                  ),
                );
              },
            ),

            // Item Pengaturan
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30.0, // Ukuran ikon lebih besar
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

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }

  Widget _buildPopularPlacesSection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Curug Terpopuler',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Jelajahscreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  popular.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                Detailwisata(destination: popular[index]),
                          ),
                        );
                      },
                      child: Popular(destination: popular[index]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Curug Lainnya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                other.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              Detailwisata(destination: other[index]),
                        ),
                      );
                    },
                    child: Other(destination: other[index]),
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
