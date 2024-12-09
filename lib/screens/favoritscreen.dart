import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/jelajahscreen.dart';
import 'package:anelisaeksplor/models/fav_model.dart';

class Favoritscreen extends StatefulWidget {
  const Favoritscreen({Key? key}) : super(key: key);

  @override
  _FavoritscreenState createState() => _FavoritscreenState();
}

class _FavoritscreenState extends State<Favoritscreen> {
  // Controller untuk scroll view
  final ScrollController _scrollController = ScrollController();

  // Menyimpan favorit yang dipilih
  List<TravelDestination> favoriteDestinations = [];

  @override
  void initState() {
    super.initState();
    // Menambahkan beberapa destinasi favorit
    favoriteDestinations =
        listDestination.sublist(0, 2); // Contoh dua destinasi favorit
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Tidak ada tombol back di kiri
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Center(
          child: Text(
            'Favorit', // Teks Favorit akan berada di tengah
            style: TextStyle(
              fontSize: 20, // Ukuran teks
              color: Colors.black, // Warna teks
            ),
          ),
        ),
        actions: [
          // Tombol tambah ikon
          IconButton(
            icon: const Icon(Icons.add,
                color: Colors.black), // Mengubah ikon menjadi tambah biasa
            onPressed: () {
              // Aksi untuk menambah favorit
            },
          ),
        ],
        backgroundColor: Colors.white, // Warna background appBar
      ),
      body: Stack(
        children: [
          // GridView untuk menampilkan gambar destinasi favorit dengan 2 kolom
          GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Menampilkan 2 kolom
              crossAxisSpacing: 10, // Spasi horizontal antar gambar
              mainAxisSpacing: 10, // Spasi vertikal antar gambar
              childAspectRatio: 1, // Rasio gambar agar terlihat proporsional
            ),
            itemCount: favoriteDestinations.length,
            itemBuilder: (context, index) {
              final destination = favoriteDestinations[index];

              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Gambar destinasi dengan love icon dalam gambar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        destination.image?.first ?? "assets/default.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200, // Ukuran gambar lebih besar
                      ),
                    ),
                    // Ikon love di dalam gambar
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
          // Tombol "Jelajahi Curug Lain" di bawah layar
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol Jelajahi Curug Lain ditekan
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
