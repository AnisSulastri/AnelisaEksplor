import 'package:anelisaeksplor/models/rekomendasi_model.dart';
import 'package:anelisaeksplor/utils/const.dart';
import 'package:flutter/material.dart';

class Detailrekomendasi extends StatefulWidget {
  final RekomendasiModel destination;
  const Detailrekomendasi({super.key, required this.destination});

  @override
  State<Detailrekomendasi> createState() => _DetailrekomendasiState();
}

class _DetailrekomendasiState extends State<Detailrekomendasi> {
  PageController pageController = PageController();
  int pageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          buildAppBar(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                buildImageSection(),
              ],
            ),
          ),
          Expanded(
            child: buildTabBarView(),
          ),
          buildBottomSection(),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: detailAppBar(),
        ),
      ),
    );
  }

  Widget detailAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            ),
          ),
        ),
        const Text(
          "Detail Destinasi",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12),
          ),
          child: const Icon(
            Icons.bookmark_border_rounded,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget buildImageSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 5),
            blurRadius: 7,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            buildImagePageView(),
            buildImageNavigation(),
          ],
        ),
      ),
    );
  }

  Widget buildImagePageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          pageView = value;
        });
      },
      children: List.generate(
        widget.destination.image!.length,
        (index) => Image.asset(
          widget.destination.image![index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildImageNavigation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        GestureDetector(
          child: Container(
            height: 75,
            width: 75,
            margin: const EdgeInsets.only(right: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  widget.destination.image![
                      pageView == widget.destination.image!.length - 1
                          ? 0
                          : pageView + 1],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        buildImageDots(),
      ],
    );
  }

  Widget buildImageDots() {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildImageDotIndicators(),
            const SizedBox(height: 15),
            buildDestinationInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildImageDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.destination.image!.length,
        (index) => GestureDetector(
          onTap: () {
            if (pageController.hasClients) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 4,
            width: 17,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: pageView == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDestinationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildDestinationTextInfo(),
        buildRatingInfo(),
      ],
    );
  }

  Widget buildDestinationTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.destination.name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              widget.destination.location,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildRatingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber[800],
              size: 23,
            ),
            const SizedBox(width: 5),
            Text(
              widget.destination.rate.toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          '(${widget.destination.review} reviews)',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildTabBarView() {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTabBar(),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.destination.description,
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
                const Center(
                  child: Text("Tidak Ada Review"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: const TabBar(
        labelColor: blueTextColor,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        unselectedLabelColor: Colors.black,
        indicatorColor: blueTextColor,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(text: 'Deskripsi'),
          Tab(text: "Review"),
        ],
      ),
    );
  }

  Widget buildBottomSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPriceInfo(),
            buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Price", style: TextStyle(fontSize: 14)),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Rp${widget.destination.price}K',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: blueTextColor,
                  ),
                ),
                TextSpan(
                  text: '/Person',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddToCartButton() {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kButtonColor,
        ),
        child: const Row(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 14,
            ),
            SizedBox(width: 5),
            Text(
              'Tambahkan ke Keranjang',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}