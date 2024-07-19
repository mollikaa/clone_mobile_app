import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';
import 'package:clone_app/widgets/NewMoviesWidget.dart';
import 'package:clone_app/widgets/UpcomingWidget.dart';


import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;  
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: theme.scaffoldBackgroundColor, 
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true, // Set floating to true to hide when scrolled up
            backgroundColor: Colors.black,
            //backgroundColor: theme.scaffoldBackgroundColor, 
            title: Center (
              child: Container(
              width: 148,
              height: 38,
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
                      icon: Icon(Icons.notifications,
                          color: Colors.white), // Set icon color to white
                      onPressed: () {
                        // Handle notifications
                      },
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                              0xFF9D1C1F), // Your desired notification color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(44.0),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  //color: Color.fromARGB(255, 33, 36, 35),
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
                          hintText: "${languageLogic.lang.hintText}",
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
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              UpcomingWidget(),
              SizedBox(height: 20), // Adjusted spacing
              NewsMovieWidget(), // Corrected widget name
              SizedBox(height: 5),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 0, // Index for the Home page
        onTap: (index) {
          // Handle navigation based on the index
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/offersPage');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/locationPage');
          } 
          //else if (index == 3) {
          //   Navigator.pushNamed(context, '/developerPage');
          // } 
          else if (index == 3) {
            Navigator.pushNamed(context, '/settingPage');
          }
        },
      ),
    );
  }
}
