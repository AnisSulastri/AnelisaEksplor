import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/screens/detailwisata.dart';
import 'package:flutter/material.dart';

class Jelajahscreen extends StatelessWidget {
  const Jelajahscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Jelajah',
          style: TextStyle(color: Colors.black), 
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildSearchBar(),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildGridView(),
      ),
    );
  }
  Widget _buildSearchBar() {
    return Container(
      width: 300, 
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300], 
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    final rekomendasiDestinations = listDestination
        .where((destination) => destination.category == 'rekomendasi')
        .toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ),
      itemCount: rekomendasiDestinations.length,
      itemBuilder: (context, index) {
        final jelajah = rekomendasiDestinations[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detailwisata(destination: jelajah),
              ),
            );
          },
          child: _buildJelajahCard(jelajah),
        );
      },
    );
  }
  Widget _buildJelajahCard(TravelDestination jelajah) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              jelajah.image?.isNotEmpty == true
                  ? jelajah.image![0]
                  : 'assets/default_image.jpg', 
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
