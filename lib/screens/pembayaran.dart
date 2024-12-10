import 'package:anelisaeksplor/screens/detailpemesanan.dart';
import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  bool showCreditCards = true; // Untuk toggle tampilan kartu kredit
  String? selectedCard; // Kartu yang dipilih, default null

  // Menangani pembayaran
  void handlePayment() {
    if (selectedCard == null) {
      // Tampilkan pesan jika tidak ada kartu/metode yang dipilih
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Silakan pilih metode pembayaran terlebih dahulu."),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Tampilkan pesan sukses jika pembayaran berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pembayaran berhasil menggunakan $selectedCard!"),
          backgroundColor: Colors.green,
        ),
      );

      // Navigasi ke halaman detail pemesanan setelah pembayaran berhasil
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detailpemesanan()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Metode Pembayaran',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pilihan metode pembayaran (Google Pay, Debit Card, dll)
            PaymentMethodButton(
              title: "Google Pay",
              onTap: () {
                setState(() {
                  selectedCard = "Google Pay";
                });
              },
              isSelected: selectedCard == "Google Pay",
            ),
            PaymentMethodButton(
              title: "Debit Card",
              onTap: () {
                setState(() {
                  selectedCard = "Debit Card";
                });
              },
              isSelected: selectedCard == "Debit Card",
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Credit Card"),
                    trailing: IconButton(
                      icon: Icon(
                        showCreditCards
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      onPressed: () {
                        setState(() {
                          showCreditCards = !showCreditCards;
                        });
                      },
                    ),
                  ),
                  if (showCreditCards)
                    Column(
                      children: [
                        RadioListTile<String>(
                          value: "BRI",
                          groupValue: selectedCard,
                          onChanged: (value) {
                            setState(() {
                              selectedCard = value;
                            });
                          },
                          title: Text("Bank BRI **** 5485"),
                        ),
                        RadioListTile<String>(
                          value: "BCA",
                          groupValue: selectedCard,
                          onChanged: (value) {
                            setState(() {
                              selectedCard = value;
                            });
                          },
                          title: Text("Bank BCA **** 4536"),
                        ),
                        RadioListTile<String>(
                          value: "Mandiri",
                          groupValue: selectedCard,
                          onChanged: (value) {
                            setState(() {
                              selectedCard = value;
                            });
                          },
                          title: Text("Bank Mandiri **** 1234"),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Aksi untuk menambahkan kartu baru
                            showDialog(
                              context: context,
                              builder: (context) {
                                String newCard = "";
                                return AlertDialog(
                                  title: Text("Tambah Kartu Baru"),
                                  content: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Nama Bank dan Nomor Kartu",
                                    ),
                                    onChanged: (value) {
                                      newCard = value;
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Tutup dialog
                                      },
                                      child: Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedCard =
                                              newCard; // Pilih kartu baru
                                        });
                                        Navigator.pop(context); // Tutup dialog
                                      },
                                      child: Text("Simpan"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.add, color: Colors.green),
                          label: Text(
                            "Tambahkan kartu baru",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {
                // Aksi untuk menambahkan metode pembayaran baru
              },
              icon: Icon(Icons.add),
              label: Text("Tambah metode baru"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey[600],
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      handlePayment(); // Memanggil fungsi pembayaran
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Bayar"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Batal"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const PaymentMethodButton({
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[50] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey[300]!,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}
