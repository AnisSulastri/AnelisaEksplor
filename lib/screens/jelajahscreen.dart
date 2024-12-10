import 'package:anelisaeksplor/models/jelajah_model.dart';
import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/detailjelajah.dart'; // Import Detailjelajah

class Jelajahscreen extends StatelessWidget {
  const Jelajahscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
        title: const Text(
          'Jelajah',
          style: TextStyle(color: Colors.black), // Teks judul di tengah
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildSearchBar(),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildGridView(),
      ),
    );
  }

  // Membuat widget search bar
  Widget _buildSearchBar() {
    return Container(
      width: 300, // Tentukan lebar search bar secara manual
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Warna latar belakang search bar
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  // Membuat widget GridView untuk menampilkan daftar jelajah
  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ),
      itemCount:
          listDestination.length, // Pastikan listDestination sudah terdefinisi
      itemBuilder: (context, index) {
        final jelajah = listDestination[index];
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman Detailjelajah
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detailjelajah(destination: jelajah),
              ),
            );
          },
          child: _buildJelajahCard(jelajah),
        );
      },
    );
  }

  // Membuat widget Card untuk item Jelajah
  Widget _buildJelajahCard(Jelajahlist jelajah) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Pastikan image tidak null
            Image.asset(
              jelajah.image?.isNotEmpty == true
                  ? jelajah.image![0]
                  : 'default_image_path', // Menggunakan default image jika tidak ada
              fit: BoxFit.cover,
            ),
            // Overlay dengan judul di atas gambar atau elemen lainnya bisa ditambahkan di sini
          ],
        ),
      ),
    );
  }
}
