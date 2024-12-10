import 'package:anelisaeksplor/screens/detailfav.dart';
import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/jelajahscreen.dart'; // Impor untuk navigasi ke halaman Jelajahscreen
import 'package:anelisaeksplor/models/fav_model.dart'; // Impor model untuk destinasi favorit
// Impor DetailFavScreen

class Favoritscreen extends StatefulWidget {
  const Favoritscreen({Key? key}) : super(key: key);

  @override
  _FavoritscreenState createState() => _FavoritscreenState();
}

class _FavoritscreenState extends State<Favoritscreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'Favorit',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Aksi untuk menambah favorit
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: listDestination.length,
            itemBuilder: (context, index) {
              final destination = listDestination[index];

              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke detail saat gambar diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detailfav(destination: destination),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          destination.image?.first ?? "assets/default.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Handle aksi love (misalnya menambah ke favorit)
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Jelajahscreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Jelajahi Curug Lain',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
