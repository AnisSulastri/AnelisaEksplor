import 'package:anelisaeksplor/models/jelajah_model.dart';
import 'package:flutter/material.dart';

class Jelajahscreen extends StatelessWidget {
  const Jelajahscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
        title: const Text(
          'Jelajah',
          style: TextStyle(color: Colors.black), // Teks judul di tengah
        ),
        actions: [
          // Menambahkan search bar tanpa Expanded
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
            offset: Offset(0, 3), // shadow position
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.grey, // Ubah warna ikon pencarian
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey), // Ubah warna hint text
        ),
      ),
    );
  }

  // Membuat widget GridView untuk menampilkan daftar jelajah
  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Jumlah kolom
        crossAxisSpacing: 8.0, // Spasi antar kolom
        mainAxisSpacing: 10.0, // Spasi antar baris
        childAspectRatio: 0.8, // Rasio gambar agar sesuai
      ),
      itemCount:
          listDestination.length, // Menggunakan panjang dari listDestination
      itemBuilder: (context, index) {
        final jelajah =
            listDestination[index]; // Mengambil item dari listDestination
        return _buildJelajahCard(jelajah);
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
            // Menampilkan gambar pertama dari list image
            Image.asset(
              jelajah.image[0], // Menggunakan asset yang pertama
              fit: BoxFit.cover,
            ),
            // Overlay dengan judul di atas gambar
          ],
        ),
      ),
    );
  }
}
