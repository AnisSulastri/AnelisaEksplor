class Jelajahlist {
  final int id;
  final List<String> image;
  final String title;
  final String category;

  // Menambahkan parameter title yang hilang pada konstruktor
  Jelajahlist({
    required this.id,
    required this.title, // Menambahkan title ke konstruktor
    required this.category,
    required this.image,
  });
}

// Daftar destinasi jelajah
List<Jelajahlist> listDestination = [
  // Popular destinations
  Jelajahlist(
    id: 1,
    title: 'Curug Cibeureum', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/cibeureum.jpg",
    ],
  ),
  Jelajahlist(
    id: 2,
    title: 'Curug Cikondang', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/cikondang.jpg",
    ],
  ),
  Jelajahlist(
    id: 3,
    title: 'Curug Ciastana', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/ciastana.jpg",
    ],
  ),
  Jelajahlist(
    id: 4,
    title: 'Curug Ciismun', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/ciismun.jpg",
    ],
  ),
  Jelajahlist(
    id: 5,
    title: 'Curug Cipandawa', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/cipendawa.jpg",
    ],
  ),
  Jelajahlist(
    id: 6,
    title: 'Curug Citambur', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/citambur.jpg",
    ],
  ),
  Jelajahlist(
    id: 7,
    title: 'Curug Ngebul', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/ngebul.jpg",
    ],
  ),
  Jelajahlist(
    id: 8,
    title: 'Curug Luhur', // Menambahkan title yang sesuai
    category: 'jelajah',
    image: [
      "assets/luhur.jpg",
    ],
  ),
];
