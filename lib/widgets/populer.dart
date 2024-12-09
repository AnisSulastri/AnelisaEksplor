import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  final TravelDestination destination;

  const Popular({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background shadow for the container
        Positioned(
          bottom: 0,
          right: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
        // Main image with text overlay
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 440,
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(destination.image![0]),
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                // Container for the text overlay
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left column: Name and location
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "NunitoSans",
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  destination.location,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "NunitoSans",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Right column: Rating
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 22,
                              color: Colors.yellow[800],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              destination.rate.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "NunitoSans",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
