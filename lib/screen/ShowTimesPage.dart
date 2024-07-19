import 'package:flutter/material.dart';
import 'SeatSelectPage.dart'; // Adjust the import paths as necessary

import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
class ShowTimesPage extends StatelessWidget {
  final String movieTitle;
  final List<Map<String, dynamic>> showTimes; // Example structure for show times
  final List<String> cinemaBranches;
  final List<String> screenTypes;

  ShowTimesPage({
    required this.movieTitle,
    required this.showTimes,
    required this.cinemaBranches,
    required this.screenTypes,
  });

  @override
  Widget build(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: theme.scaffoldBackgroundColor, 
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          movieTitle,
          style: TextStyle(color: Colors.white ),
        ),

        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieTitle,
              style: TextStyle(
                color:isDarkMode? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildShowTimes(context),
            SizedBox(height: 20),
            _buildCinemaBranches(context),
            SizedBox(height: 20),
            _buildScreenTypes(context),
          ],
        ),
      ),
    );
  }

  Widget _buildShowTimes(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${languageLogic.lang.timeTicket}',
          style: TextStyle(
            color: isDarkMode ?Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ...showTimes.map((showTime) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeatSelectPage(
                    movieTitle: movieTitle,
                    showTime: '${showTime['date']} - ${showTime['time']}',
                    price: showTime['price'].toString(),
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDarkMode? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
              BoxShadow(
                color: const Color(0xFF292837).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
              ),
            ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${showTime['date']} - ${showTime['time']}',
                    style: TextStyle(
                      color:isDarkMode? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${showTime['price']}',
                    style: TextStyle(
                      color: isDarkMode? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCinemaBranches(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${languageLogic.lang.cinema}:',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ...cinemaBranches.map((branch) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              branch,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.black,
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildScreenTypes(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${languageLogic.lang.screenType}:',
          style: TextStyle(
            color: isDarkMode? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: screenTypes.map((screenType) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Chip(
                label: Text(
                  screenType,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Colors.grey[800],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
