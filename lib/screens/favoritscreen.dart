import 'package:anelisaeksplor/models/destination_model.dart'; // Model destinasi/ Widget Favorit
import 'package:anelisaeksplor/screens/jelajahscreen.dart';
import 'package:anelisaeksplor/widgets/favorit.dart';
import 'package:flutter/material.dart';

class Favoritscreen extends StatefulWidget {
  const Favoritscreen({Key? key}) : super(key: key);

  @override
  _FavoritscreenState createState() => _FavoritscreenState();
}

class _FavoritscreenState extends State<Favoritscreen> {
  final ScrollController _scrollController = ScrollController();
  final List<TravelDestination> favorit = listDestination
      .where((element) => element.category == 'favorit')
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
        title: const Center(
          child: Text(
            'Favorit',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_rounded, // Ikon 'add' dengan outline
              color: Colors.black, // Warna ikon
            ),
            onPressed: () {
              // Aksi untuk menambah favorit
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Display message if no favorite destinations
          favorit.isEmpty
              ? const Center(
                  child: Text(
                    'Belum ada destinasi favorit.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: favorit.length,
                  itemBuilder: (context, index) {
                    final destination = favorit[index];
                    return FavoritWidget(
                      destination: destination,
                      isFavorited: true,
                      onFavoriteToggle: () {
                        setState(() {
                          favorit.remove(destination);
                        });
                      },
                    );
                  },
                ),
          // Button to navigate to Jelajah screen
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Jelajahscreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Jelajahi Curug Lain',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
