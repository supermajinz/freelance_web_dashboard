import 'package:dash/bottom.dart';
import 'package:dash/screen/cash.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:dash/screen/transfer.dart';
import 'package:dash/wallets/actionbotton.dart';
import 'package:dash/wallets/appbartitle.dart';
import 'package:dash/wallets/cardmodel.dart';
import 'package:dash/wallets/cardwidget.dart';
import 'package:dash/wallets/coostomlist.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalletHome extends StatefulWidget {
  const WalletHome({super.key});

  @override
  State<WalletHome> createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  int activeIndex = 0;

  // List of CardModel instances to display in the carousel.
  final List<CardModel> cards = [
    CardModel(
        balance: "\$5250.25",
        number: "12345678",
        expiry: "10/24",
        color: 0xFF8A2BE2),
    CardModel(
        balance: "\$1200.00",
        number: "87654321",
        expiry: "12/25",
        color: 0xFF20B2AA),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const AppBarTitle(),
        // Custom title widget.
        actions: [],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemCount: cards.length,
                itemBuilder: (context, index, realIndex) {
                  final card = cards[index];
                  return CardWidget(card: card); // Custom card widget.
                },
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                key: const Key('carouselSlider'), // Key for testing.
              ),
              const SizedBox(height: 10),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: cards.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.black54,
                  ),
                  key: const Key('pageIndicator'), // Key for testing.
                ),
              ),
              const SizedBox(height: 40),
              const ActionButtons(key: Key('actionButtons')),
              // Custom action buttons widget.
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => cash()));
                  },
                  child: Container(
                      child: CustomListTile(
                    icon: Icons.send,
                    iconColor: Colors.orange,
                    title: 'cash withdraw',
                    subtitle: 'Payment and Income',
                    key: Key('cash withdraw'), // Key for testing.
                  ))),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransferScreen()));
                  },
                  child: Container(
                    child: const CustomListTile(
                      icon: Icons.history,
                      iconColor: Colors.green,
                      title: 'Transactions',
                      subtitle: 'Transaction History',
                      key: Key('transactionsTile'),
                      // Key for testing.
                    ),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(key: Key('bottomAppBar')),
      // Custom bottom app bar.

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
