// ignore: file_names
import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color here
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Legend ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Cinema",
                                style: TextStyle(
                                  color: Color(
                                      0xFF9D1C1F), // Change text color to #9D1C1F
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Replace the search box with an image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'images/offer6.jpg',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "What we offer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // Added SizedBox for spacing
              _buildOffers(), // Function to build offers
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Customnavbar(), // Fixed at the bottom
    );
  }

  Widget _buildOffers() {
    return Column(
      children: [
        _buildOffer(
          imagePath: "images/offers1.jpg",
          title: "Golden Pass",
        ),
        _buildOffer(
          imagePath: "images/offer2.jpg",
          title: "Celebrate Coca-Cola Day with us!",
        ),
        _buildOffer(
          imagePath: "images/offer3.jpg",
          title:
              "Special price for students and senior citizen. Applicable on week days, weekends and public Holiday",
        ),
        _buildOffer(
          imagePath: "images/offer4.jpg",
          title: "Buy 1 Get 1 Ticket Free!",
        ),
        _buildOffer(
          imagePath: "images/offers5.jpg",
          title:
              "Enjoy weekly discounts by simply registering as a Smart VIP subscribers",
        ),
      ],
    );
  }

  Widget _buildOffer({
    required String imagePath,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10), // Adjusted padding
      child: Container(
        width: double.infinity, // Set width to fill the container
        decoration: BoxDecoration(
          color: const Color(0xFF292837),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF292837).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 10), // Added padding
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 200, // Height remains the same
                  width: double.infinity, // Set width to fill the container
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
