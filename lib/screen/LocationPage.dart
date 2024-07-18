import 'package:flutter/material.dart';
import 'LocationDetailsPage.dart';
import 'package:clone_app/widgets/CustomNavBar.dart'; // Ensure the path is correct

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
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
                                  color: Color(0xFF9D1C1F),
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
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 36, 35),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.white54, size: 20),
                    SizedBox(width: 7),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "All Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildLocation(
                      context: context,
                      imagePath: "images/loc1.jpg",
                      nameLocation: "Legend Premium Exchange",
                      batch: "Exchange Square Mall",
                      icon: Icons.location_on,
                    ),
                    _buildLocation(
                      context: context,
                      imagePath: "images/loc2.jpg",
                      nameLocation: "Legend Cinema Sihanoukville",
                      batch: "PGB-5-021, 4th Floor of Prince",
                      icon: Icons.location_on,
                    ),
                    _buildLocation(
                      context: context,
                      imagePath: "images/loc3.jpg",
                      nameLocation: "Legend Eden Garden",
                      batch: "City Center Boulevard, Sangkat Srah Chak",
                      icon: Icons.location_on,
                    ),
                    _buildLocation(
                      context: context,
                      imagePath: "images/loc4.jpg",
                      nameLocation: "Legend Noro Mall",
                      batch: "5th floor, Chip Mong Noro Mall",
                      icon: Icons.location_on,
                    ),
                    _buildLocation(
                      context: context,
                      imagePath: "images/loc4.jpg",
                      nameLocation: "Legend Meanchey",
                      batch: "3rd Floor of New Steung Mean Chey market",
                      icon: Icons.location_on,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 2, // Index for the Location page
        onTap: (index) {
          // Handle navigation based on the index
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/offersPage');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/locationPage');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/developerPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/settingPage');
          }
        },
      ),
    );
  }

  Widget _buildLocation({
    required BuildContext context,
    required String imagePath,
    required String nameLocation,
    required String batch,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailsPage(
              imagePath: imagePath,
              nameLocation: nameLocation,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          width: double.infinity,
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      imagePath,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  nameLocation,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      batch,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
