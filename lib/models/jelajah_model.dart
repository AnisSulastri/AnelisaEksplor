import 'dart:math';

Random random = Random();
const description =
    'Wisata daerah yang menawarkan jalur pendakian yang penuh petualangan dan pemandangan yang menakjubkan. Curug-curug yang sangat indah';

class Jelajahlist {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  Jelajahlist({
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

List<Jelajahlist> listDestination = [
  // rekomen destinations
  Jelajahlist(
      id: 1,
      name: "Curug Cibeureum",
      category: 'jelajah',
      image: [
        "assets/cibeureum.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 15,
      description: description,
      rate: 4.8),
  Jelajahlist(
      id: 2,
      name: "Curug Cikondang",
      category: 'jelajah',
      image: [
        "assets/cikondang.jpg",
      ],
      location: 'Cikondang, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  Jelajahlist(
      id: 3,
      name: "Curug citambur",
      category: 'jelajah',
      image: [
        "assets/citambur.jpg",
      ],
      location: 'citambur, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  Jelajahlist(
      id: 4,
      name: "Curug Ciismun",
      category: 'jelajah',
      image: [
        "assets/ciismun.jpg",
      ],
      location: 'Cibodas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  Jelajahlist(
      id: 5,
      name: "Curug Ciastana",
      category: 'jelajah',
      image: [
        "assets/ciastana.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  Jelajahlist(
      id: 6,
      name: "Curug Ngebul",
      category: 'jelajah',
      image: [
        "assets/ngebul.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  Jelajahlist(
      id: 7,
      name: "Curug Cipendawa",
      category: 'jelajah',
      image: [
        "assets/cipendawa.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  Jelajahlist(
      id: 8,
      name: "Curug Walanda",
      category: 'jelajah',
      image: [
        "assets/walanda.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),

  Jelajahlist(
      id: 9,
      name: "Curug Luhur",
      category: 'jelajah',
      image: [
        "assets/luhur.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),

  Jelajahlist(
      id: 10,
      name: "Curug Dadali",
      category: 'jelajah',
      image: [
        "assets/dadali.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
];
