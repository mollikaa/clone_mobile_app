import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String movieTitle;
  final String genre;
  final String duration;
  final String releaseDate;
  final String classification;
  final String description;
  final String imagePath;
  final List<String> screenTypes;

  MovieDetailPage({
    required this.movieTitle,
    required this.genre,
    required this.duration,
    required this.releaseDate,
    required this.classification,
    required this.description,
    required this.imagePath,
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
        title: Center(
          child: Container(
          width: 148,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: AssetImage(
                  "images/logo legend.png"), // Replace with your logo image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        ),
        actions: [
              AnimatedOpacity(
                opacity: 1.0, // Initially visible
                duration:
                    Duration(milliseconds: 300), // Adjust duration as needed
                child: Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.upload,
                          color: Colors.white), // Set icon color to white
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        width: 7,
                        height: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
                IconButton(
                  icon: Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
                  onPressed: () {
                    // Handle video play action
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return Dialog(
                    //       child: AspectRatio(
                    //         aspectRatio: 16 / 9, // Your video player screen
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  SizedBox(height: 5),
                  _buildScreenTypes(screenTypes),
                  SizedBox(height: 5),
                  _buildLabelWithIcon(Icons.movie, 'Genre', genre),
                  SizedBox(height: 5),
                  _buildLabelWithIcon(Icons.timer, 'Duration', duration),
                  SizedBox(height: 5),
                  _buildLabelWithIcon(Icons.calendar_today, 'Release Date', releaseDate),
                  SizedBox(height: 5),
                  _buildLabelWithIcon(Icons.label, 'Classification', classification),
                  SizedBox(height: 20),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0), // Padding at the top of the button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/showtime');
                      },
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'View Show Time',
                        style: TextStyle(color: Colors.white, fontSize: 16), // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenTypes(List<String> screenTypes) {
    return Row(
      children: screenTypes.map((screenType) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Chip(
            label: Text(
              screenType,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            backgroundColor: Colors.grey[800],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLabelWithIcon(IconData icon, String label, String value) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon, color: const Color.fromARGB(179, 247, 12, 12)),
          onPressed: () {
          },
        ),
        SizedBox(width: 5),
        Text(
          '$label: $value',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

}