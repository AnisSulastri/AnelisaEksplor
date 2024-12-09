import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/splashscreen.dart'; // Halaman Splashscreen
import 'package:anelisaeksplor/screens/register.dart'; // Halaman Register
import 'package:anelisaeksplor/screens/login.dart'; // Halaman Login

void main() {
  runApp(AnelisaEksplor());
}

class AnelisaEksplor extends StatelessWidget {
  const AnelisaEksplor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Halaman awal yang ditampilkan
      routes: {
        '/': (context) => const Splashscreen(), // Halaman Splashscreen
        '/register': (context) => const Register(), // Halaman Register
        '/login': (context) => const Login(), // Halaman Login
      },
    );
  }
}
