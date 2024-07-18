import 'package:clone_app/screen/DeveloperPage.dart';
import 'package:clone_app/screen/HomePage.dart';
import 'package:clone_app/screen/LocationPage.dart';
import 'package:clone_app/screen/OffersPage.dart';
import 'package:clone_app/screen/SettingPage.dart';
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
        '/': (context) => const HomePage(),
        '/offersPage': (context) => const OffersPage(),
        '/locationPage': (context) => const LocationPage(),
        '/developerPage': (context) => const DeveloperPage(),
        '/settingPage': (context) => const Settingpage(),
      },
    );
  }
}
