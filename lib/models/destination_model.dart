import 'dart:math';

Random random = Random();
const description =
    'Wisata daerah yang menawarkan jalur pendakian yang penuh petualangan dan pemandangan yang menakjubkan. Curug-curug yang sangat indah';

class TravelDestination {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  TravelDestination({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.location,
    required this.review,
    required this.price,
    required this.description,
    required this.rate,
  });
}

List<TravelDestination> listDestination = [
  // rekomen destinations
  TravelDestination(
      id: 1,
      name: "Curug Cibeureum",
      category: 'popular',
      image: [
        "assets/cibeureum.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 15,
      description: description,
      rate: 4.8),
  TravelDestination(
      id: 2,
      name: "Curug Cikondang",
      category: 'popular',
      image: [
        "assets/cikondang.jpg",
      ],
      location: 'Cikondang, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 3,
      name: "Curug citambur",
      category: 'popular',
      image: [
        "assets/citambur.jpg",
      ],
      location: 'citambur, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 4,
      name: "Curug Ciismun",
      category: 'popular',
      image: [
        "assets/ciismun.jpg",
      ],
      location: 'Cibodas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 5,
      name: "Curug Ciastana",
      category: 'other',
      image: [
        "assets/ciastana.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 6,
      name: "Curug Ngebul",
      category: 'other',
      image: [
        "assets/ngebul.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 7,
      name: "Curug Cipendawa",
      category: 'other',
      image: [
        "assets/cipendawa.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 8,
      name: "Curug Walanda",
      category: 'other',
      image: [
        "assets/walanda.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 9,
      name: "Curug Luhur",
      category: 'other',
      image: [
        "assets/luhur.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 10,
      name: "Curug Dadali",
      category: 'other',
      image: [
        "assets/dadali.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
];
