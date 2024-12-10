import 'package:flutter/material.dart';
import 'package:anelisaeksplor/models/rekomendasi_model.dart';
import 'package:anelisaeksplor/widgets/rekomendasi.dart';
import 'package:anelisaeksplor/screens/detailrekomendasi.dart'; // Import utama

class RekomendasiScreen extends StatelessWidget {
  RekomendasiScreen({Key? key}) : super(key: key);

  // Memfilter daftar destinasi dengan kategori 'rekomendasi'
  final List<RekomendasiModel> rekomendasi = listRekomendasi
      .where((element) => element.category == 'rekomendasi')
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Recommendation', // Judul halaman
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: rekomendasi.length, // Jumlah item dalam daftar rekomendasi
        itemBuilder: (context, index) {
          final destination =
              rekomendasi[index]; // Ambil item berdasarkan index
          return Padding(
            padding: const EdgeInsets.only(bottom: 15), // Jarak antar item
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Detailrekomendasi(
                      destination: destination, // Navigasi ke halaman detail
                    ),
                  ),
                );
              },
              child: Rekomendasi(
                destination: destination, // Tampilkan item rekomendasi
              ),
            ),
          );
        },
      ),
    );
  }
}
