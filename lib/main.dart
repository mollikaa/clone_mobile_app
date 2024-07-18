import 'package:clone_app/screen/DeveloperPage.dart';
import 'package:clone_app/screen/HomePage.dart';
import 'package:clone_app/screen/LocationPage.dart';
import 'package:clone_app/screen/OffersPage.dart';
import 'package:clone_app/screen/FbPage.dart';
import 'package:clone_app/screen/SettingPage.dart';
import 'package:clone_app/screen/ShowTimesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // to hide status bar and below buttons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0F1110),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/offersPage': (context) => const OffersPage(),
        '/locationPage': (context) => const LocationPage(),
        '/developerPage': (context) => const DeveloperPage(),
        '/fbPage': (context) => const FbPage(),
        '/settingPage': (context) => const Settingpage(),
        '/showtime': (context) => ShowTimesPage(movieTitle: 'Movie Title Here', // Provide default values or handle routing data
          showTimes: [
            {'date': '2024-07-20', 'time': '14:15', 'price': '\$4.50'},
            {'date': '2024-07-21', 'time': '18:00', 'price': '\$5.00'},
            {'date': '2024-07-21', 'time': '21:00', 'price': '\$7.00'},
          ],
          cinemaBranches: ['Cinema 1 - Legend Premium Exchange Square', 'Cinema 2 - Legend Noro Mall', 'Cinema 3 - Legend Siem Reap'],
          screenTypes: ['2D', '3D', 'ScreenX'],),
      },
    );
  }
}
