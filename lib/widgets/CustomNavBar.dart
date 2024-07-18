import 'package:flutter/material.dart';

class Customnavbar extends StatelessWidget {
  const Customnavbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjusted height to accommodate labels
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(),
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
            icon: Icons.local_drink,
            label: 'F&B',
            routeName: '/fbPage',
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
    bool isSelected = ModalRoute.of(context)?.settings.name == routeName;

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
            color: isSelected ? const Color(0xFF9D1C1F) : Colors.white,
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
