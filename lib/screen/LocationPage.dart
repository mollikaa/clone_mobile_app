// ignore: file_names
import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

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
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 36, 35),
                  borderRadius:
                      BorderRadius.circular(5), // Adjust border radius here
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white54,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        // Add functionality here for search input handling
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                          // color: Color(0xFF292837),
                          // borderRadius: BorderRadius.circular(10),
                          ),
                      // child: Icon(
                      //   Icons.filter_list,
                      //   color: Colors.white54,
                      // ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              const SizedBox(height: 15), // Added SizedBox for spacing
              _buildLocations(), // Function to build locations
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Customnavbar(), // Fixed at the bottom
    );
  }

  Widget _buildLocations() {
    return Column(
      children: [
        _buildLocation(
          imagePath: "images/loc1.jpg",
          nameLocation: "Legend Cinema 271 Mega Mall",
          batch: "3rd Floor, Chip Mong Mega Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          imagePath: "images/loc2.jpg",
          nameLocation: "Legend Cinema Sihanoukville",
          batch: "PGB-5-021, 4th Floor of Prince",
          icon: Icons.location_on,
        ),
        _buildLocation(
          imagePath: "images/loc3.jpg",
          nameLocation: "Legend Eden Garden",
          batch: "City Center Boulevard, Sangkat Srah Chak",
          icon: Icons.location_on,
        ),
        _buildLocation(
          imagePath: "images/loc4.jpg",
          nameLocation: "Legend Noro Mall",
          batch: "5th floor, Chip Mong Noro Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          imagePath: "images/loc4.jpg",
          nameLocation: "Legend Meanchey",
          batch: "3rd Floor of New Steung Mean Chey market",
          icon: Icons.location_on,
        ),
      ],
    );
  }

  Widget _buildLocation({
    required String imagePath,
    required String nameLocation,
    required String batch,
    required IconData icon,
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
                    height: 200, // Height remains the same
                    width: double.infinity, // Set width to fill the container
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
    );
  }
}
