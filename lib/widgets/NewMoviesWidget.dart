import 'package:flutter/material.dart';
import 'package:clone_app/screen/MovieDetailsPage.dart';


import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
class NewsMovieWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${languageLogic.lang.newMovie}",
                  style: TextStyle(
                    // color: Colors.white,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "More",
                  style: TextStyle(
                    // color: Colors.white,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: _buildMovieRows(context),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMovieRows(BuildContext context) {
    List<Widget> rows = [];

    // Assuming you have 9 movies to display
    for (int i = 0; i < 9; i += 2) {
      Widget movieRow;

      // Check if there are two movies to display in a row
      if (i + 1 < 9) {
        movieRow = Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Adjusted padding here
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMovieItem(context, i),
              SizedBox(width: 10), // Increased padding between items
              _buildMovieItem(context, i + 1),
            ],
          ),
        );
      } else {
        // Display the last single movie
        movieRow = Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Adjusted padding here
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildMovieItem(context, i),
            ],
          ),
        );
      }

      rows.add(movieRow);
    }

    return rows;
  }

  Widget _buildMovieItem(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(
            movieTitle: 'Movie Title Here', // Replace with actual data
            genre: 'Action/Ad', // Replace with actual data
            duration: '2h 30m', // Replace with actual data
            releaseDate: '2024-07-18', // Replace with actual data
            classification: 'G', // Replace with actual data
            description: 'This is the movie description. Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. This is the movie description. Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', // Replace with actual data
            imagePath: 'images/cus${index + 1}.jpg', // Replace with actual data
            screenTypes: ['2D', '3D', 'ScreenX'],
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 178,
      height: 295,
      decoration: BoxDecoration(
        color: Color(0xFF292837),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF292837).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "images/cus${index + 1}.jpg", // Assuming your image naming convention matches
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Movie Title Here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Action/Ad",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "8.5",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}