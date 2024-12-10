import 'package:anelisaeksplor/models/rekomendasi_model.dart';
import 'package:flutter/material.dart';

// Menambahkan widget RekomendasiPesan yang menerima parameter 'destination'
class Rekomendasipesan extends StatefulWidget {
  final RekomendasiModel
      destination; // Menerima RekomendasiScreen sebagai parameter

  // Constructor menerima destination
  const Rekomendasipesan({required this.destination, Key? key})
      : super(key: key);

  @override
  State<Rekomendasipesan> createState() => _RekomendasipesanState();
}

class _RekomendasipesanState extends State<Rekomendasipesan> {
  int ticketCount = 1; // Jumlah awal tiket

  // Fungsi untuk menambah jumlah tiket
  void incrementTicket() {
    setState(() {
      ticketCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Tiket",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris dengan gambar dan tombol jumlah tiket
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar tiket dengan teks nama wisata dan harga
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      // Gambar tiket
                      Image.asset(
                        'assets/tiket_pesan.png', // Menggunakan gambar tiket_pesan.png
                        fit: BoxFit.cover,
                        height: 140, // Sesuaikan tinggi gambar
                        width: 270,
                      ),
                      // Teks di atas gambar
                      Positioned(
                        left: 30,
                        bottom: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama Wisata
                            Text(
                              widget.destination.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            // Harga
                            Text(
                              "${widget.destination.price}k",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width: 5), // Memberikan jarak antar gambar dan tombol
                // Tombol + di luar gambar
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Tombol +
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green, width: 2), // Border hijau
                          borderRadius: BorderRadius.circular(
                              50), // Membuat border melingkar
                        ),
                        child: IconButton(
                          onPressed: incrementTicket,
                          icon: const Icon(Icons.add,
                              color: Colors.green), // Warna ikon hijau
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Menampilkan jumlah tiket
                      Text(
                        ticketCount.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Informasi harga dan total
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Harga", style: TextStyle(fontSize: 16)),
                      // Mengambil harga tiket dari TravelDestination
                      Text("Rp. ${widget.destination.price}",
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jumlah Tiket",
                          style: TextStyle(fontSize: 16)),
                      Text(ticketCount.toString(),
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        "Rp. ${ticketCount * widget.destination.price}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Tombol Buat Pesanan
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pesanan berhasil dibuat!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  "Buat Pesanan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
