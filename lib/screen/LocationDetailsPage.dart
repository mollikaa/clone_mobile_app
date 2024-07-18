import 'package:flutter/material.dart';
// Import the NewMoviesWidget

class LocationDetailsPage extends StatefulWidget {
  final String imagePath;
  final String nameLocation;

  const LocationDetailsPage({
    super.key,
    required this.imagePath,
    required this.nameLocation,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LocationDetailsPageState createState() => _LocationDetailsPageState();
}

class _LocationDetailsPageState extends State<LocationDetailsPage> {
  bool _isNowShowing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.nameLocation,
            style: const TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              widget.imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isNowShowing = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isNowShowing ? Colors.red : Colors.grey,
                      ),
                      child: const Text("Now Showing"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isNowShowing = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !_isNowShowing ? Colors.red : Colors.grey,
                      ),
                      child: const Text("Details"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isNowShowing ? _buildNowShowing() : _buildDetails(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNowShowing() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 30, // Number of days to show
            itemBuilder: (context, index) {
              final date = DateTime.now().add(Duration(days: index));
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    '${date.day}/${date.month}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Showing",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: _buildMovieRows(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Number of Hall:",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "5",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "Opening Hour:",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "10:00 AM - 10:00 PM",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "Address:",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "123 Cinema Street, City",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  List<Widget> _buildMovieRows() {
    List<Widget> rows = [];

    for (int i = 0; i < 9; i += 2) {
      Widget movieRow;

      if (i + 1 < 9) {
        movieRow = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMovieItem(i),
              const SizedBox(width: 10),
              _buildMovieItem(i + 1),
            ],
          ),
        );
      } else {
        movieRow = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      margin: const EdgeInsets.only(bottom: 10),
      width: 178,
      height: 295,
      decoration: BoxDecoration(
        color: const Color(0xFF292837),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF292837).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "images/cus${index + 1}.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
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
    );
  }
}
