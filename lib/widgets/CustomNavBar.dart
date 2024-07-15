import 'package:flutter/material.dart';

class Customnavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(25),
          // topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/'); // Navigate to home page
            },
            child: Icon(
              Icons.home,
              size: 32,
              color: Color(0xFF9D1C1F),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/categoryPage'); // Navigate to category page
            },
            child: Icon(
              Icons.category,
              size: 32,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/developerPage'); // Navigate to DeveloperPage
            },
            child: Icon(
              Icons.people,
              size: 32,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/settingPage'); // Navigate to setting page
            },
            child: Icon(
              Icons.settings,
              size: 32,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
