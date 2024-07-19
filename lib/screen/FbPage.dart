import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart'; // Adjust import path as needed


import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
class FbPage extends StatelessWidget {
  const FbPage({Key? key}) : super(key: key);

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
                          text:  TextSpan(
                            children: [
                              TextSpan(
                                text: "F&B",
                                style: TextStyle(
                                  // color: Colors.white,
                                  color: isDarkMode ? Colors.white : Colors.black,
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
              // Replace the search box with an image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    'images/fb.jpg',
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${languageLogic.lang.cinema}",
                      style: TextStyle(
                        // color: Colors.white,
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Added SizedBox for spacing
              _buildLocations(context), // Function to build locations
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 0, // Set the appropriate selected index
        onTap: (index) {
          // Handle navigation based on the index
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/offersPage');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/locationPage');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/developerPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/settingPage');
          }
        },
      ),
    );
  }

   Widget _buildLocations(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;  
    return Column(
      children: [
        _buildLocation(
          context: context,
          nameLocation: "Legend Eden Garden",
          batch: "City Center Boulevard, Sangkat Srag Chak",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Toul Kork",
          batch: "TK Avenue Mall, Street 315",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Premium Exchange Square",
          batch: "Street 106, Corner of Street 61",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend SenSok",
          batch: "4th floor, Chip Mong SenSok Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Meanchey",
          batch: "3rd Floor of New Steung Mean Chey market",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Olympia",
          batch: "6tth floor, The Olympia Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Noro Mall",
          batch: "5th floor, Chip Mong Noro Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Midtown Mall",
          batch: "1st Floor Midtown Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend K Mall",
          batch: "2nd Floor K Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend 271 Mega Mall",
          batch: "3rd Floor Chip Mong Mega Mall",
          icon: Icons.location_on,
        ),
        _buildLocation(
          context: context,
          nameLocation: "Legend Siem Reap",
          batch: "Level 3, The Heritage Walk",
          icon: Icons.location_on,
        ),
      ],
    );
  }

  Widget _buildLocation( {
    required BuildContext context,
    required String nameLocation,
    required String batch,
    required IconData icon,
  }) {
        var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
         // color: const Color(0xFF292837),
          color: isDarkMode ? Color(0xFF292837) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF292837).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            // Adjust row for better layout
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    nameLocation,
                    style: TextStyle(
                      //color: Colors.white,
                      color: isDarkMode ?Colors.white : Color(0xFF292837),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        batch,
                        style:  TextStyle(
                          // color: Colors.white,
                          color: isDarkMode ?Colors.white : Color(0xFF292837),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white), // Forward icon
            ],
          ),
        ),
      ),
    );
  }
}
