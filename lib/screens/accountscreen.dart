import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/login.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/user.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Gais',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    MenuItem(
                      title: 'Pengaturan Akun',
                      onPressed: () {
                        print("Navigating to Settings");
                      },
                      hasArrow: true,
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: const Text(
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
      backgroundColor: Colors.white,
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final VoidCallback? onPressed;
  final bool hasArrow;

  const MenuItem({
    required this.title,
    this.titleColor,
    this.onPressed,
    this.hasArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
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
            if (hasArrow)
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
