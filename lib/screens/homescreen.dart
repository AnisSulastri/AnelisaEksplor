import 'package:anelisaeksplor/screens/navdraw.dart';
import 'package:flutter/material.dart';
import 'package:anelisaeksplor/screens/jelajahscreen.dart';
import 'package:anelisaeksplor/models/destination_model.dart';
import 'package:anelisaeksplor/screens/detailwisata.dart';
import 'package:anelisaeksplor/widgets/populer.dart';
import 'package:anelisaeksplor/widgets/other.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TravelDestination> popular = listDestination
      .where((element) => element.category == 'popular')
      .toList();
  final List<TravelDestination> other =
      listDestination.where((element) => element.category == 'other').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Hi, ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const TextSpan(
                text: 'Gais',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              TextSpan(
                text: '\nExplore now',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.green[900]),
              ),
            ],
          ),
        ),
      ),
      endDrawer: NavDrawer.buildDrawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildPopularPlacesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }

  Widget _buildPopularPlacesSection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Place',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Jelajahscreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  popular.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                Detailwisata(destination: popular[index]),
                          ),
                        );
                      },
                      child: Popular(destination: popular[index]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Other Waterfalls',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                other.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              Detailwisata(destination: other[index]),
                        ),
                      );
                    },
                    child: Other(destination: other[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
