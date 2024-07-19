import 'package:flutter/material.dart';
import 'SeatSelectPage.dart'; // Adjust the import paths as necessary

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildShowTimes(context),
            SizedBox(height: 20),
            _buildCinemaBranches(),
            SizedBox(height: 20),
            _buildScreenTypes(),
          ],
        ),
      ),
    );
  }

  Widget _buildShowTimes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Show Times & Tickets Price:',
          style: TextStyle(
            color: Colors.white,
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
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${showTime['date']} - ${showTime['time']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${showTime['price']}',
                    style: TextStyle(
                      color: Colors.white,
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

  Widget _buildCinemaBranches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cinema Branches:',
          style: TextStyle(
            color: Colors.white,
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
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildScreenTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screen Types:',
          style: TextStyle(
            color: Colors.white,
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
