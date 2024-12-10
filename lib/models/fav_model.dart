import 'dart:math';

Random random = Random();

const description =
    'Tempat-tempat wisata menawarkan beragam pengalaman, masing-masing dengan pesona dan daya tarik yang unik. Dari lanskap alam yang memukau hingga landmark bersejarah, selalu ada sesuatu untuk setiap wisatawan. Wisata PesisirDestinasi seperti pantai tropis mengundang relaksasi dengan air yang jernih, sementara daerah pegunungan menawarkan jalur pendakian yang penuh petualangan dan pemandangan yang menakjubkan.';

class FavModel {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  FavModel({
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

List<FavModel> listDestination = [
  FavModel(
    id: 1,
    name: "Curug Cibeureum",
    category: 'popular',
    image: ["assets/cibeureum.jpg"],
    location: 'Cipanas, Cianjur',
    review: random.nextInt(250) + 20,
    price: 15,
    description: description,
    rate: 4.8,
  ),
  FavModel(
    id: 2,
    name: "Curug Cikondang",
    category: 'popular',
    image: ["assets/cikondang.jpg"],
    location: 'Cikondang, Cianjur',
    review: random.nextInt(250) + 20,
    price: 10,
    description: description,
    rate: 4.9,
  ),
];
