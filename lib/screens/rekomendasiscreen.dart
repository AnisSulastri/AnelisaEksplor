import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/screens/detailwisata.dart';
import 'package:flutter/material.dart';
import 'package:anelisaeksplor/widgets/rekomendasi.dart'; 

class RekomendasiScreen extends StatelessWidget {
  RekomendasiScreen({Key? key}) : super(key: key);

  final List<TravelDestination> rekomendasi = listDestination
      .where((element) => element.category == 'rekomendasi')
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: const Text(
          'Recommendation', 
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: rekomendasi.length, 
        itemBuilder: (context, index) {
          final destination =
              rekomendasi[index]; 
          return Padding(
            padding: const EdgeInsets.only(bottom: 15), 
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Detailwisata(
                      destination: destination, 
                    ),
                  ),
                );
              },
              child: Rekomendasi(
                destination: destination, 
              ),
            ),
          );
        },
      ),
    );
  }
}
