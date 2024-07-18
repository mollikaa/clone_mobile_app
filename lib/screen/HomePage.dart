import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';
import 'package:clone_app/widgets/NewMoviesWidget.dart';
import 'package:clone_app/widgets/UpcomingWidget.dart';

<<<<<<< HEAD
class HomePage extends StatelessWidget {
  const HomePage({super.key});
=======
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAlertAnimated = false;
  bool _isScrolled = false;

  void toggleAlertAnimation() {
    setState(() {
      isAlertAnimated = !isAlertAnimated;
    });
  }
>>>>>>> 0a8f38de88eedf62211a45edbd2893222d95399d

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
=======
      backgroundColor: Colors.black,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _isScrolled = scrollNotification.metrics.pixels > 0;
            });
          }
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0), // Adjust top padding as needed
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedOpacity(
                      opacity: _isScrolled ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        width: 148,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage("images/logo legend.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 28,
                        ),
                        Positioned(
                          top: 4,
                          right: 5,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: isAlertAnimated ? 12 : 7,
                            height: isAlertAnimated ? 12 : 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isAlertAnimated ? Colors.red : Color(0xFF9D1C1F),
                            ),
>>>>>>> 0a8f38de88eedf62211a45edbd2893222d95399d
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD
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
=======
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(44.0),
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 33, 36, 35),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white54,
                          size: 24,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            onChanged: (value) {
                              // Handle search input
                            },
>>>>>>> 0a8f38de88eedf62211a45edbd2893222d95399d
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 44,
                          width: 44,
                          // Optionally add color and border radius to this container if needed
                        ),
                      ],
                    ),
<<<<<<< HEAD
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
=======
                  ),
                ),
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 10),
                  UpcomingWidget(),
                  SizedBox(height: 20), // Adjusted spacing
                  NewsMovieWidget(),
                  SizedBox(height: 5),
                ]),
              ),
>>>>>>> 0a8f38de88eedf62211a45edbd2893222d95399d
            ],
          ),
        ),
      ),
<<<<<<< HEAD
      bottomNavigationBar: const Customnavbar(), // Fixed at the bottom
=======
      bottomNavigationBar: Customnavbar(),
>>>>>>> 0a8f38de88eedf62211a45edbd2893222d95399d
    );
  }
}
