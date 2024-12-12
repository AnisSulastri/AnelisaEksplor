import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/detailwisata.dart'; 
import 'package:anelisaeksplor/models/destination_model.dart'; 

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
                    : 'assets/default.jpg', 
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
              onPressed: onFavoriteToggle, 
            ),
          ),
        ],
      ),
    );
  }
}
