import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';

class Categorypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // to go back to home pages
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    // Add other widgets for your category page content here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Customnavbar(),
    );
  }
}
