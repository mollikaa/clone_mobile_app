import 'package:flutter/material.dart';

class NewsMovieWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  "New Movie",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "More",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: _buildMovieRows(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMovieRows() {
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
              _buildMovieItem(i),
              SizedBox(width: 10), // Increased padding between items
              _buildMovieItem(i + 1),
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
              _buildMovieItem(i),
            ],
          ),
        );
      }

      rows.add(movieRow);
    }

    return rows;
  }

  Widget _buildMovieItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
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
            child: const Column(
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
    );
  }
}
