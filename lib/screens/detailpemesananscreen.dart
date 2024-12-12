import 'package:flutter/material.dart';

class Detailpemesanan extends StatelessWidget {
  const Detailpemesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detail Pemesanan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCard1(),
            const SizedBox(height: 20),
            buildCard2(),
            const SizedBox(height: 20),
            buildCard3(),
            const SizedBox(height: 20),
            buildQRCodeSection(),
            const Spacer(),
            buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget buildCard1() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Curug Cikondang - Cianjur",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Senin, 12 Desember 2024",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildCard2() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Jumlah Pengunjung", style: TextStyle(fontSize: 14)),
              SizedBox(height: 5),
              Text("Dewasa: 3",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Text("Metode Bayar", style: TextStyle(fontSize: 14)),
              SizedBox(height: 5),
              Text("Credit Card",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text("Harga Tiket", style: TextStyle(fontSize: 14)),
              SizedBox(height: 5),
              Text("Rp 5.000",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Text("Tiket ID", style: TextStyle(fontSize: 14)),
              SizedBox(height: 5),
              Text("CC121224",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard3() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Total :",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(
            "Rp 15.000",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget buildQRCodeSection() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/qrcode.png',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Note : Perlihatkan kode QR saat memasuki tempat wisata",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
      ],
    );
  }

  Widget buildBottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade900,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Download",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.green.shade900),
              foregroundColor: Colors.green.shade900,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
