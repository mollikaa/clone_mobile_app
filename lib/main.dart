import 'package:clone_app/screen/CategoryPage.dart';
import 'package:clone_app/screen/DeveloperPage.dart';
import 'package:clone_app/screen/HomePage.dart';
import 'package:clone_app/screen/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
     
        '/': (context) => HomePage(),
        '/categoryPage': (context) => Categorypage(),
        '/developerPage': (context) => Developerpage(),
        '/settingPage': (context) => Settingpage(),
      },
    );
  }
}
