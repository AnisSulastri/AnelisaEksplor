import 'package:flutter/material.dart';

class Detailpemesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Detail Pemesanan"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Curug Cikondang - Cianjur",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Senin, 12 Desember 2024",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                Divider(),
                _buildDetailRow("Jumlah Pengunjung", "Dewasa : 3"),
                _buildDetailRow("Harga Tiket", "Rp. 5.000"),
                _buildDetailRow("Metode Bayar", "Credit Card"),
                _buildDetailRow("Tiket ID", "CC121224"),
                _buildDetailRow("Berangkat", "10.00 am"),
                _buildDetailRow("Pulang", "s/d Selesai"),
                Divider(),
                SizedBox(height: 16),
                Text(
                  "Total : Rp. 15.000",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Image.network(
                  "https://via.placeholder.com/150",
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 8),
                Text(
                  "Note: Perlihatkan kode QR saat memasuki tempat wisata",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Aksi Download
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Download"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Aksi Cancel
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Cancel"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
