import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';
import 'package:clone_app/widgets/NewMoviesWidget.dart';
import 'package:clone_app/widgets/UpcomingWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAlertAnimated = false;

  void toggleAlertAnimation() {
    setState(() {
      isAlertAnimated = !isAlertAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedOpacity(
                  opacity: 1.0, // You can adjust this based on your logic
                  duration: Duration(milliseconds: 100),
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(44.0),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 20),
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
              ),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedOpacity(
                        opacity: top > kToolbarHeight + 50 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 0),
                        child: Container(
                          width: 148,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            image: DecorationImage(
                              image: AssetImage("images/logo legend.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              UpcomingWidget(),
              SizedBox(height: 35),
              NewsMovieWidget(),
              SizedBox(height: 5),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Customnavbar(),
    );
  }
}
