import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart';


import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark; 
    return Scaffold(
     // backgroundColor: Colors.black, // Set the background color here
     backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
                                text: "Legend ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Cinema",
                                style: TextStyle(
                                  color: Color(
                                      0xFF9D1C1F), // Change text color to #9D1C1F
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  //color: const Color.fromARGB(255, 33, 36, 35),
                  color: isDarkMode ? Color.fromARGB(255, 33, 36, 35) : Color(0xFF9D1C1F) ,
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
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: "${languageLogic.lang.hintText}",
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
                      decoration: BoxDecoration(),
                      // child: Icon(
                      //   Icons.filter_list,
                      //   color: Colors.white54,
                      // ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${languageLogic.lang.aboutUs}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // Added SizedBox for spacing
              _buildDeveloperProfiles(context), // Function to build developer profiles
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 3, // Index for the Developer page
        onTap: (index) {
          // Handle navigation based on the index
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/offersPage');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/locationPage');
          } 
          // else if (index == 3) {
          //   Navigator.pushNamed(context, '/developerPage');
          // } 
          else if (index == 3) {
            Navigator.pushNamed(context, '/fbPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/settingPage');
          }
        },
      ),
    );
  }

  Widget _buildDeveloperProfiles(BuildContext context) {
        var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;  
    return Column(
      children: [
        _buildDeveloperProfile(
          context: context,
          imagePath: "images/cus1.jpg",
          name: "Saran Mollika",
          role: "Software Engineering",
          group: "Group B",
        ),
        _buildDeveloperProfile(
          context: context,
          imagePath: "images/cus2.jpg",
          name: "Saroun Sakura",
          role: "Software Engineering",
          group: "Group B",
        ),
        _buildDeveloperProfile(
          context: context,
          imagePath: "images/cus3.jpg",
          name: "Koem Socheata",
          role: "Software Engineering",
          group: "Group A",
        ),
        _buildDeveloperProfile(
          context: context,
          imagePath: "images/cus4.jpg",
          name: "Uth Kim Oun",
          role: "Software Engineering",
          group: "Group A",
        ),
      ],
    );
  }

  Widget _buildDeveloperProfile({
    required BuildContext context,
    required String imagePath,
    required String name,
    required String role,
    required String group,
  }) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          //color: const Color(0xFF292837),
          color: isDarkMode ? const Color(0xFF292837) : Colors.white,
          borderRadius: BorderRadius.circular(10),
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
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:  TextStyle(
                      // color: Colors.white,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    role,
                    style: TextStyle(
                      //color: Colors.white70,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      Text(
                        group,
                        style:  TextStyle(
                          //color: Colors.white70,
                          color: isDarkMode ? Colors.white : Colors.black,
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
