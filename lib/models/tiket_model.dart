class TiketModel {
  final String nama;
  final String tanggal;
  final String waktu;
  final int jumlah;
  final String category;

  TiketModel({
    required this.nama,
    required this.tanggal,
    required this.waktu,
    required this.jumlah,
    required this.category,
  });
}

class TiketData {
  static final List<TiketModel> listTiket = [
    TiketModel(
      nama: "Curug Cikondang",
      tanggal: "12/12/2024",
      waktu: "10:00",
      jumlah: 3,
      category: TiketCategory.daftar,
    ),
    TiketModel(
      nama: "Curug Cibeureum",
      tanggal: "30/12/2024",
      waktu: "08:00",
      jumlah: 4,
      category: TiketCategory.riwayat,
    ),
    TiketModel(
      nama: "Curug Dadali",
      tanggal: "01/10/2024",
      waktu: "09:00",
      jumlah: 2,
      category: TiketCategory.daftar,
    ),
    TiketModel(
      nama: "Curug Cibeureum",
      tanggal: "15/09/2024",
      waktu: "07:00",
      jumlah: 5,
      category: TiketCategory.riwayat,
    ),
    TiketModel(
      nama: "Curug Cibeureum",
      tanggal: "15/09/2024",
      waktu: "07:00",
      jumlah: 5,
      category: TiketCategory.riwayat,
    ),
    TiketModel(
      nama: "Curug Cibeureum",
      tanggal: "15/09/2024",
      waktu: "07:00",
      jumlah: 5,
      category: TiketCategory.riwayat,
    ),
    TiketModel(
      nama: "Curug Cibeureum",
      tanggal: "15/09/2024",
      waktu: "07:00",
      jumlah: 5,
      category: TiketCategory.riwayat,
    ),
  ];
}

class TiketCategory {
  static const String daftar = "daftar";
  static const String riwayat = "riwayat";
}
