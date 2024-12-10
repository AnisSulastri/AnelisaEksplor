import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/splashscreen.dart'; 
import 'package:anelisaeksplor/screens/register.dart'; 
import 'package:anelisaeksplor/screens/login.dart'; 

void main() {
  runApp(AnelisaEksplor());
}

class AnelisaEksplor extends StatelessWidget {
  const AnelisaEksplor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
      },
    );
  }
}
