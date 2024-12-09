import 'package:anelisaeksplor/screens/accountscreen.dart';
import 'package:anelisaeksplor/screens/favoritscreen.dart';
import 'package:anelisaeksplor/screens/homescreen.dart';
import 'package:anelisaeksplor/screens/tiketscreen.dart';
import 'package:flutter/material.dart';

class Navigationscreen extends StatefulWidget {
  // Konstruktor const untuk Navigationscreen
  const Navigationscreen({super.key});

  @override
  _NavigationscreenState createState() => _NavigationscreenState();
}

class _NavigationscreenState extends State<Navigationscreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    TiketScreen(),
    Favoritscreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Mengubah halaman sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        iconSize: 28,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
