import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/utils/const.dart';
import 'package:flutter/material.dart';

class Other extends StatelessWidget {
  final TravelDestination destination;

  const Other({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          // Image section
          Container(
            height: 85,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(destination.image![0]),
              ),
            ),
          ),
          const SizedBox(
              width: 10), // Added some more space between image and text

          // Details section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  destination.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "NunitoSans",
                  ),
                ),
                const SizedBox(height: 5),

                // Location row
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      destination.location,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Rating and review section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(width: 5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${destination.rate} ",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "(${destination.review} reviews)",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Price section
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Ensures the price is centered vertically
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Rp${destination.price}",
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: blueTextColor),
                    ),
                    TextSpan(
                      text: "/Orang",
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
