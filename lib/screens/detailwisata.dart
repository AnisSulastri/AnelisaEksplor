import 'package:flutter/material.dart';
import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/screens/detailpesanan.dart';

class Detailwisata extends StatelessWidget {
  final TravelDestination destination;

  const Detailwisata({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(destination.image![0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                        const Icon(Icons.location_on_outlined),
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
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailpesanan(
                                    destination: destination,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "Pesan",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Rp${destination.price}/orang',
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
