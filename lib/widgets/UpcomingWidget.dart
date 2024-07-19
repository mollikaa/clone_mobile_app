import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({Key? key}) : super(key: key);

  @override
  _UpcomingWidgetState createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  double _viewportFraction = 0.9; // Adjust the fraction to show a portion of the next image
  late Timer _timer; // Add a reference to the timer

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: _viewportFraction);

    // Set up a timer for auto-sliding
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!mounted) {
        timer.cancel(); // Cancel the timer if the widget is no longer mounted
        return;
      }
      setState(() {
        if (_currentPage < 5) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer in dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${languageLogic.lang.upComming}",
                style: TextStyle(
                  // color: Colors.white,
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implement your 'See all' logic here
                },
                child: Text(
                  "See all",
                  style: TextStyle(
                    // color: Colors.white,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 6, // Adjusted itemCount to 6
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  var position = _pageController.position;
                  if (position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value) * 300,
                      width: MediaQuery.of(context).size.width * _viewportFraction - 5.0, // Adjusted width with padding
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
