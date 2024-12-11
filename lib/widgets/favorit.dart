import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/detailwisata.dart'; // Pastikan file ini benar-benar ada
import 'package:anelisaeksplor/models/destination_model.dart'; // Import model destinasi

class FavoritWidget extends StatelessWidget {
  final TravelDestination destination;
  final bool isFavorited;
  final VoidCallback onFavoriteToggle;

  const FavoritWidget({
    Key? key,
    required this.destination,
    required this.isFavorited,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail wisata
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailwisata(destination: destination),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                (destination.image?.isNotEmpty ?? false)
                    ? destination.image!.first
                    : 'assets/default.jpg', // Gambar default jika null atau kosong
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: onFavoriteToggle, // Hapus atau toggle favorit
            ),
          ),
        ],
      ),
    );
  }
}
