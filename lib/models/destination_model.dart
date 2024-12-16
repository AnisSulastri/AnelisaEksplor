import 'dart:math';

Random random = Random();
const description =
    'Curug di Cianjur merupakan destinasi wisata alam yang memukau dengan keindahan air terjun yang jernih dan suasana sejuk khas pegunungan. Dikelilingi oleh hamparan pepohonan hijau dan pemandangan yang asri, dan menawarkan pengalaman yang menenangkan sekaligus menyegarkan.';

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
      price: 15000,
      description: description,
      rate: 4.8),
  TravelDestination(
      id: 2,
      name: "Curug Cikondang",
      category: 'popular',
      image: [
        "assets/cikondang.jpg",
      ],
      location: 'Campaka, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 3,
      name: "Curug citambur",
      category: 'popular',
      image: [
        "assets/citambur.jpg",
      ],
      location: 'Pasir Kuda, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
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
      price: 16000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 5,
      name: "Curug Ciastana",
      category: 'other',
      image: [
        "assets/ciastana.jpg",
      ],
      location: 'Kadupandak, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 6,
      name: "Curug Ngebul",
      category: 'other',
      image: [
        "assets/ngebul.jpg",
      ],
      location: 'Pagelaran, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 7,
      name: "Curug Cipendawa",
      category: 'other',
      image: [
        "assets/cipendawa.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 8,
      name: "Curug Walanda",
      category: 'other',
      image: [
        "assets/walanda.jpg",
      ],
      location: 'Cibinong, Cianjur',
      review: random.nextInt(250) + 20,
      price: 5000,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 9,
      name: "Curug Luhur",
      category: 'other',
      image: [
        "assets/luhur.jpg",
      ],
      location: 'Cibinong, Cianjur',
      review: random.nextInt(250) + 20,
      price: 45000,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 10,
      name: "Curug Dadali",
      category: 'other',
      image: [
        "assets/dadali.jpg",
      ],
      location: 'Kadupandak, Cianjur',
      review: random.nextInt(250) + 20,
      price: 5000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 11,
      name: "Curug Cibeureum",
      category: 'rekomendasi',
      image: [
        "assets/cibeureum.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 15000,
      description: description,
      rate: 4.8),
  TravelDestination(
      id: 12,
      name: "Cikondang",
      category: 'rekomendasi',
      image: [
        "assets/cikondang.jpg",
      ],
      location: 'Campaka, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 13,
      name: "Curug citambur",
      category: 'rekomendasi',
      image: [
        "assets/citambur.jpg",
      ],
      location: 'Pasirkuda, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 14,
      name: "Curug Ciismun",
      category: 'rekomendasi',
      image: [
        "assets/ciismun.jpg",
      ],
      location: 'Cibodas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 16000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 15,
      name: "Curug Ciastana",
      category: 'rekomendasi',
      image: [
        "assets/ciastana.jpg",
      ],
      location: 'Kadupandak, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 16,
      name: "Curug Ngebul",
      category: 'rekomendasi',
      image: [
        "assets/ngebul.jpg",
      ],
      location: 'Pagelaran, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 17,
      name: "Curug Cipendawa",
      category: 'rekomendasi',
      image: [
        "assets/cipendawa.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 18,
      name: "Curug Walanda",
      category: 'rekomendasi',
      image: [
        "assets/walanda.jpg",
      ],
      location: 'Cibinong, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10000,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 19,
      name: "Curug Luhur",
      category: 'rekomendasi',
      image: [
        "assets/luhur.jpg",
      ],
      location: 'Cibinong, Cianjur',
      review: random.nextInt(250) + 20,
      price: 45000,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 20,
      name: "Curug Dadali",
      category: 'rekomendasi',
      image: [
        "assets/dadali.jpg",
      ],
      location: 'Kadupandak, Cianjur',
      review: random.nextInt(250) + 20,
      price: 5000,
      description: description,
      rate: 4.9),
  TravelDestination(
      id: 21,
      name: "Curug Cibeureum",
      category: 'favorit',
      image: [
        "assets/cibeureum.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 15000,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 22,
      name: "Curug Luhur",
      category: 'favorit',
      image: [
        "assets/luhur.jpg",
      ],
      location: 'Cibinong, Cianjur',
      review: random.nextInt(250) + 20,
      price: 45000,
      description: description,
      rate: 4.9),

  TravelDestination(
      id: 23,
      name: "Curug Dadali",
      category: 'favorit',
      image: [
        "assets/dadali.jpg",
      ],
      location: 'Kadupandak, Cianjur',
      review: random.nextInt(250) + 20,
      price: 5000,
      description: description,
      rate: 4.9),
];
