import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  final TravelDestination destination;

  const Popular({super.key, required this.destination});

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  bool isFavorited = false; // Track whether the destination is favorited

  // Method to toggle the favorite status
  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited; // Toggle the favorite status
    });
  }

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
            width: MediaQuery.of(context).size.width *
                0.65, // Adjust width dynamically
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.destination.image![0]),
              ),
            ),
            child: Stack(
              children: [
                // Heart icon for favorites, positioned directly inside the image
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(
                      isFavorited
                          ? Icons.favorite
                          : Icons.favorite_border, // Change the icon
                      color: isFavorited
                          ? Colors.red
                          : Colors.white, // Change color to red when favorited
                      size: 30,
                    ),
                    onPressed:
                        toggleFavorite, // Call toggleFavorite when clicked
                  ),
                ),
                // Container for the text overlay
                Positioned(
                  bottom: 5,
                  left: 5,
                  right: 5,
                  child: Container(
                    width: double
                        .infinity, // Make the width stretch across the container
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
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
                                widget.destination.name,
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
                                    widget.destination.location,
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
                                widget.destination.rate.toString(),
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
