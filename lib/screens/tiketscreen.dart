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
    final List<TiketModel> daftar = TiketData.listTiket
        .where((element) => element.category == 'daftar')
        .toList();
    final List<TiketModel> riwayat = TiketData.listTiket
        .where((element) => element.category == 'riwayat')
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTabButton("Daftar", 0),
              const SizedBox(width: 8),
              _buildTabButton("Riwayat", 1),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.green[200],
        padding: const EdgeInsets.all(8.0),
        child: _selectedTab == 0
            ? TiketListWidget(tiketList: daftar, selectedTab: _selectedTab)
            : TiketListWidget(tiketList: riwayat, selectedTab: _selectedTab),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
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
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedTab == 0 ? "Daftar Tiket" : "Riwayat Tiket",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                selectedTab == 0 ? "Status: Aktif" : "Status: Tidak Aktif",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
        tiketList.isNotEmpty
            ? Column(
                children: tiketList.map((tiket) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/tiket.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 100.0, // Tinggi elemen lebih kecil
                      child: Stack(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0), // Geser teks ke kanan
                              child: Text(
                                tiket.nama,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 4.0), // Geser teks ke kanan
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${tiket.tanggal}",
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      const SizedBox(width: 30),
                                      Text(
                                        "${tiket.waktu}",
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    "Tiket: ${tiket.jumlah} orang",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20.0,
                            right: 25.0, // Geser QR ke kiri sedikit
                            child: Icon(
                              Icons.qr_code,
                              size: 50.0, // Ukuran ikon lebih kecil
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
      ],
    );
  }
}
