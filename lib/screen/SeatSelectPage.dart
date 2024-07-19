import 'package:flutter/material.dart';

class SeatSelectPage extends StatefulWidget {
  final String movieTitle;
  final String showTime;
  final String price;

  SeatSelectPage({
    required this.movieTitle,
    required this.showTime,
    required this.price,
  });

  @override
  _SeatSelectPageState createState() => _SeatSelectPageState();
}

class _SeatSelectPageState extends State<SeatSelectPage> {
  List<List<bool>> seats = List.generate(10, (index) => List.generate(20, (index) => false));
  List<List<bool>> reservedSeats = List.generate(10, (index) => List.generate(20, (index) => false));

  void _toggleSeatSelection(int row, int column) {
    setState(() {
      seats[row][column] = !seats[row][column];
    });
  }

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
        title: Text(
          widget.movieTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movieTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.showTime,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.red,
            child: Center(
              child: Text(
                'SCREEN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: seats.length * seats[0].length,
              itemBuilder: (context, index) {
                int row = index ~/ seats[0].length;
                int column = index % seats[0].length;
                bool isSelected = seats[row][column];
                bool isReserved = reservedSeats[row][column];

                return GestureDetector(
                  onTap: isReserved
                      ? null
                      : () => _toggleSeatSelection(row, column),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isReserved
                          ? Colors.red
                          : isSelected
                              ? Colors.green
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '${String.fromCharCode(65 + row)}${column + 1}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Seats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      spacing: 8,
                      children: _getSelectedSeats()
                          .map((seat) => Text(
                                seat,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${_getTotalPrice()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle continue button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getSelectedSeats() {
    List<String> selectedSeats = [];
    for (int i = 0; i < seats.length; i++) {
      for (int j = 0; j < seats[i].length; j++) {
        if (seats[i][j]) {
          selectedSeats.add('${String.fromCharCode(65 + i)}${j + 1}');
        }
      }
    }
    return selectedSeats;
  }

  double _getTotalPrice() {
    int selectedSeatCount = seats.expand((row) => row).where((seat) => seat).length;
    return selectedSeatCount * 10.0; // Example seat price calculation
  }
}
