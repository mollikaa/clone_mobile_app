// ignore: file_names
import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';

class FbPage extends StatelessWidget {
  const FbPage({super.key});

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
                                text: "F&B",
                                style: TextStyle(
                                  color: Colors.white,
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
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    'images/fb.jpg',
                    height: 170,
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
                      "Choose Cinema",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Added SizedBox for spacing
              _buildLocations(), // Function to build offers
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
          nameLocation: "Legend Eden Garden",
          batch: "City Center Boulevard, Sangkat Srag Chak",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Toul Kork",
          batch: "TK Avenue Mall, Street 315",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Premium Exchange Square",
          batch: "Street 106, Corner of Street 61",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend SenSok",
          batch: "4th floor, Chip Mong SenSok Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Meanchey",
          batch: "3rd Floor of New Steung Mean Chey market",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Olympia",
          batch: "6tth floor, The Olympia Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Noro Mall",
          batch: "5th floor, Chip Mong Noro Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Midtown Mall",
          batch: "1st Floor Midtown Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend K Mall",
          batch: "2nd Floor K Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend 271 Mega Mall",
          batch: "3rd Floor Chip Mong Mega Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          nameLocation: "Legend Siem Reap",
          batch: "Level 3, The Heritage Walk",
          icon: Icons.location_on,
        ),
      ],
    );
  }

  Widget _buildLocation({
  required String nameLocation,
  required String batch,
  required IconData icon,
}) {
  return Padding(
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
        child: Row(
          // Adjust row for better layout
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
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
            const Icon(Icons.arrow_forward_ios, color:Colors.white), // Forward icon
          ],
        ),
      ),
    ),
  );
}
}