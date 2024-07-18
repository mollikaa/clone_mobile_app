// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpcomingWidgetState createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  final double _viewportFraction =
      0.9; // Adjust the fraction to show a portion of the next image

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0, viewportFraction: _viewportFraction);

    // Set up a timer for auto-sliding
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (_currentPage < 5) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Upcoming Movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implement your 'See all' logic here
                },
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 6, // Adjusted itemCount to 6
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value) * 300,
                      width: MediaQuery.of(context).size.width *
                              _viewportFraction -
                          2.0, // Adjusted width with padding
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "images/my draw${index + 1}.jpg", // Adjusted path to your image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
