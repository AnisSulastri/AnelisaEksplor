import 'package:flutter/material.dart';
import 'package:anelisaeksplor/models/tiket_model.dart';

class TiketScreen extends StatefulWidget {
  const TiketScreen({super.key});

  @override
  _TiketScreenState createState() => _TiketScreenState();
}

class _TiketScreenState extends State<TiketScreen> {
  int _selectedTab = 0; // 0 untuk Daftar, 1 untuk Riwayat

  @override
  Widget build(BuildContext context) {
    // Memanggil tiket berdasarkan kategori
    final List<TiketModel> daftar = TiketData.listTiket
        .where((element) => element.category == 'daftar')
        .toList();
    final List<TiketModel> riwayat = TiketData.listTiket
        .where((element) => element.category == 'riwayat')
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200], // Menggunakan warna yang konsisten
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTabButton("Daftar", 0),
              const SizedBox(width: 12),
              _buildTabButton("Riwayat", 1),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.green[200], // Latar belakang konsisten di seluruh body
        padding: const EdgeInsets.all(8.0),
        child: _selectedTab == 0
            ? TiketListWidget(tiketList: daftar, selectedTab: _selectedTab)
            : TiketListWidget(tiketList: riwayat, selectedTab: _selectedTab),
      ),
    );
  }

  // Widget tombol navigasi Daftar dan Riwayat
  Widget _buildTabButton(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isSelected ? Colors.green[800]! : Colors.transparent,
            width: 2.0,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.green[800] : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class TiketListWidget extends StatelessWidget {
  final List<TiketModel> tiketList;
  final int selectedTab;

  const TiketListWidget({
    Key? key,
    required this.tiketList,
    required this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Header dengan status
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedTab == 0 ? "Daftar Tiket" : "Riwayat Tiket",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                selectedTab == 0 ? "Status: Aktif" : "Status: Tidak Aktif",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
        // Menampilkan daftar tiket
        tiketList.isNotEmpty
            ? Column(
                children: tiketList.map((tiket) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage('assets/tiket.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 130.0,
                      child: Stack(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(12.0),
                            title: Text(
                              tiket.nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${tiket.tanggal}",
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                      const SizedBox(width: 50),
                                      Text(
                                        "${tiket.waktu}",
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    "Tiket: ${tiket.jumlah} orang",
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 25.0,
                            right: 15.0,
                            child: Icon(
                              Icons.qr_code,
                              size: 70.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            : Center(
                child: Text(
                  "Tidak ada tiket tersedia.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
      ],
    );
  }
}
