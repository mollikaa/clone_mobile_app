import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart'; // Ensure correct import path

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context); // Navigate back
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 9, 233, 91),
                        size: 30,
                      ),
                    ),
                    // Add other widgets for your setting page content here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 4, // Example: Set your selected index here
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
}
