import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/screens/pembayaranscreen.dart';
import 'package:flutter/material.dart'; // Import model destination

class Detailpesanan extends StatefulWidget {
  final TravelDestination
      destination; // Menerima TravelDestination sebagai parameter

  // Constructor menerima destination
  Detailpesanan({required this.destination});

  @override
  _DetailpesananState createState() => _DetailpesananState();
}

class _DetailpesananState extends State<Detailpesanan> {
  int ticketCount = 1; // Jumlah awal tiket

  void incrementTicket() {
    setState(() {
      ticketCount++;
    });
  }

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
        title: Text("Pesanan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
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
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            // Harga
                            Text(
                              "Rp. ${widget.destination.price}",
                              style: TextStyle(
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
                SizedBox(width: 5), // Memberikan jarak antar gambar dan tombol
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
                          icon: Icon(Icons.add,
                              color: Colors.green), // Warna ikon hijau
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(width: 10),
                      // Menampilkan jumlah tiket
                      Text(
                        ticketCount.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Informasi harga dan total
            Container(
              color: Colors.orange[50],
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
                      Text("Harga", style: TextStyle(fontSize: 16)),
                      // Mengambil harga tiket dari TravelDestination
                      Text("Rp. ${widget.destination.price}",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jumlah Tiket", style: TextStyle(fontSize: 16)),
                      Text(ticketCount.toString(),
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        "Rp. ${ticketCount * widget.destination.price}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            // Tombol Buat Pesanan
            ElevatedButton(
              onPressed: () {
                // Tampilkan SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Pesanan berhasil dibuat!")),
                );

                // Navigasi ke halaman pembayaran setelah SnackBar ditampilkan
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pembayaranscreen()),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Text(
                  "Buat Pesanan",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
