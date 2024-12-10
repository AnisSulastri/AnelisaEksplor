import 'package:anelisaeksplor/screens/detailpesanan.dart';
import 'package:flutter/material.dart';
import 'package:anelisaeksplor/models/destination_model.dart'; // Pastikan untuk mengimport halaman DetailPesanan

class Detailwisata extends StatelessWidget {
  final TravelDestination destination;

  Detailwisata({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (not full screen)
          Container(
            height: MediaQuery.of(context).size.height *
                0.8, // 80% of screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(destination.image![0]), // First image in list
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          destination.name,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(
                          destination.rate.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.redAccent),
                        const SizedBox(width: 4.0),
                        Text(destination.location),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      destination.description,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman DetailPesanan dengan destinasi yang dipilih
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detailpesanan(
                                  destination:
                                      destination, // Pass the selected destination
                                ),
                              ),
                            );
                          },
                          child: const Text('Pesan Sekarang'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[200],
                          ),
                        ),
                        Text(
                          '${destination.price}k/orang',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 40.0,
            left: 16.0,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
