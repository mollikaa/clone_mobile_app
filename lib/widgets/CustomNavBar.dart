// ignore: file_names
import 'package:flutter/material.dart';

class Customnavbar extends StatelessWidget {
  const Customnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjusted height to accommodate labels
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(25),
            // topRight: Radius.circular(25),
            ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            context,
            icon: Icons.home,
            label: 'Home',
            routeName: '/',
          ),
          _buildNavItem(
            context,
            icon: Icons.percent,
            label: 'Offers',
            routeName: '/offersPage',
          ),
          _buildNavItem(
            context,
            icon: Icons.location_on,
            label: 'Location',
            routeName: '/locationPage',
          ),
          _buildNavItem(
            context,
            icon: Icons.people,
            label: 'Developers',
            routeName: '/developerPage',
          ),
          _buildNavItem(
            context,
            icon: Icons.widgets,
            label: 'More',
            routeName: '/settingPage',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required String label,
      required String routeName}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
          const SizedBox(height: 5), // Space between icon and label
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
