import 'dart:math';

Random random = Random();
const description =
    'Tempat-tempat wisata menawarkan beragam pengalaman, masing-masing dengan pesona dan daya tarik yang unik. Dari lanskap alam yang memukau hingga landmark bersejarah, selalu ada sesuatu untuk setiap wisatawan. Wisata PesisirDestinasi seperti pantai tropis mengundang relaksasi dengan air yang jernih, sementara daerah pegunungan menawarkan jalur pendakian yang penuh petualangan dan pemandangan yang menakjubkan.';

class RekomendasiModel {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  RekomendasiModel({
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

List<RekomendasiModel> listRekomendasi = [
  // rekomen destinations
  RekomendasiModel(
      id: 1,
      name: "Curug Cibeureum",
      category: 'rekomendasi',
      image: [
        "assets/cibeureum.jpg",
      ],
      location: 'Cipanas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 15,
      description: description,
      rate: 4.8),
  RekomendasiModel(
      id: 2,
      name: "Curug Cikondang",
      category: 'rekomendasi',
      image: [
        "assets/cikondang.jpg",
      ],
      location: 'Cikondang, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  RekomendasiModel(
      id: 3,
      name: "Curug citambur",
      category: 'rekomendasi',
      image: [
        "assets/citambur.jpg",
      ],
      location: 'citambur, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  RekomendasiModel(
      id: 4,
      name: "Curug Ciismun",
      category: 'rekomendasi',
      image: [
        "assets/ciismun.jpg",
      ],
      location: 'Cibodas, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  RekomendasiModel(
      id: 5,
      name: "Curug Ciastana",
      category: 'rekomendasi',
      image: [
        "assets/ciastana.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  RekomendasiModel(
      id: 6,
      name: "Curug Ngebul",
      category: 'rekomendasi',
      image: [
        "assets/ngebul.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  RekomendasiModel(
      id: 7,
      name: "Curug Cipendawa",
      category: 'rekomendasi',
      image: [
        "assets/cipendawa.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
  RekomendasiModel(
      id: 8,
      name: "Curug Walanda",
      category: 'rekomendasi',
      image: [
        "assets/walanda.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),

  RekomendasiModel(
      id: 9,
      name: "Curug Luhur",
      category: 'rekomendasi',
      image: [
        "assets/luhur.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),

  RekomendasiModel(
      id: 10,
      name: "Curug Dadali",
      category: 'rekomendasi',
      image: [
        "assets/dadali.jpg",
      ],
      location: 'Cianjur Selatan, Cianjur',
      review: random.nextInt(250) + 20,
      price: 10,
      description: description,
      rate: 4.9),
];
