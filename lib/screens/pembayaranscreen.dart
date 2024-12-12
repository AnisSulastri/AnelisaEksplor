import 'package:anelisaeksplor/screens/detailpemesananscreen.dart';
import 'package:flutter/material.dart';

class Pembayaranscreen extends StatefulWidget {
  const Pembayaranscreen({super.key});

  @override
  State<Pembayaranscreen> createState() => _PembayaranscreenState();
}

class _PembayaranscreenState extends State<Pembayaranscreen> {
  int? _selectedCard;

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              const SizedBox(height: 10),
              const Text("Pemberitahuan", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              const Text(
                "Pembayaran Sukses",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Detailpemesanan()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Metode Pemesanan",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCard("Google Play", Icons.arrow_forward_ios),
            const SizedBox(height: 10),
            buildCard("Debit Card", Icons.arrow_forward_ios),
            const SizedBox(height: 10),
            buildDropdownCard(),
            const SizedBox(height: 10),
            buildAddNewMethodCard(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _showSuccessModal(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                ),
                child: const Text(
                  "Bayar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green.shade900),
                  foregroundColor: Colors.green.shade900,
                ),
                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData trailingIcon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green.shade900, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
          Icon(trailingIcon, color: Colors.black),
        ],
      ),
    );
  }

  Widget buildDropdownCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green.shade900, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Credit Card",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              const Icon(Icons.keyboard_arrow_up, color: Colors.black),
            ],
          ),
          const SizedBox(height: 5),
          buildInnerCard("assets/logo_bri.png", "Bank BRI **** 5485", 0),
          const SizedBox(height: 5),
          buildInnerCard("assets/logo_bca.png", "Bank BCA **** 4536", 1),
          const SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.green),
              ),
              const Text("Add new card",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInnerCard(String logoPath, String title, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(logoPath, width: 40, height: 40),
          Text(title,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          Radio<int>(
            value: index,
            groupValue: _selectedCard,
            onChanged: (int? value) {
              setState(() {
                _selectedCard = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildAddNewMethodCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green.shade900, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: Colors.black),
          const SizedBox(width: 10),
          const Text(
            "Add new methods",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
