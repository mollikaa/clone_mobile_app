import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';
import 'package:clone_app/widgets/NewMoviesWidget.dart';
import 'package:clone_app/widgets/UpcomingWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color here
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Hello ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Koem",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 237, 64,
                                      64), // Change text color to #9D1C1F
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "What do you want to watch?",
                          style: TextStyle(
                            color: Color.fromARGB(141, 242, 235, 235),
                          ),
                        ),
                      ],
                    ),
                    ClipOval(
                      child: Image.asset(
                        "images/panda.jpg", // Adjusted image asset path
                        height: 50,
                        width: 50,
                        fit: BoxFit
                            .cover, // Ensure the image covers the circular container
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 36, 35),
                  borderRadius:
                      BorderRadius.circular(5), // Adjust border radius here
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white54,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        // Add functionality here for search input handling
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                          // color: Color(0xFF292837),
                          // borderRadius: BorderRadius.circular(10),
                          ),
                      // child: Icon(
                      //   Icons.filter_list,
                      //   color: Colors.white54,
                      // ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const UpcomingWidget(),
              const SizedBox(height: 40),
              NewsMovieWidget(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Customnavbar(), // Fixed at the bottom
    );
  }
}
