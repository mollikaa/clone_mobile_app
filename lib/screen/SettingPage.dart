import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart'; // Ensure correct import path


import 'package:provider/provider.dart';
import 'package:clone_app/setting/fontSize_logic.dart';
import 'package:clone_app/setting/language_constant.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
import 'package:clone_app/widgets/SignInWidget.dart';
class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageLogic = context.watch<LanguageLogic>();
    int themeIndex = context.watch<ThemeLogic>().themeIndex;    
    return Scaffold(
      body: SingleChildScrollView(
        
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context); // Navigate back
                      },
                      child: Text("Account", style: TextStyle(fontSize: 22),),
                    ),
                                        SizedBox(height: 20),
                    SignInSignUpButtons(),
                    // Text(languageLogic.lang.settings,
                    //     style: TextStyle(fontSize: fontsizeLogic.size)),
                    SizedBox(height: 20),
                    ExpansionTile(
                      title: Text("${languageLogic.lang.aboutUs}"),
                      children: [
                        ListTile(
                          title: Text("${languageLogic.lang.aboutUs}"),
                          onTap: (){
                            Navigator.pushNamed(context, '/developerPage');
                          },
                        ),
                        ListTile(
                          title: Text("${languageLogic.lang.contactUs}"),
                          onTap: (){

                          },
                        ),
                        ListTile(
                          title: Text("${languageLogic.lang.privacy}"),
                          onTap: (){},
                        ),
                        ListTile(
                          title: Text("${languageLogic.lang.term}"),
                          onTap: (){},
                        )
                      ],
                      
                      ),
                    SizedBox(height: 20),
                    ExpansionTile(
                      title: Text(languageLogic.lang.theme),
                      initiallyExpanded: true,
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone_android),
                          title: Text(languageLogic.lang.toSystemMode),
                          onTap: () {
                            //themeLogic.changeToSystemMode();
                            context.read<ThemeLogic>().changeToSystemMode();
                          },
                          trailing: themeIndex == 0
                              ? Icon(Icons.check)
                              : null,
                        ),
                        ListTile(
                          leading: Icon(Icons.light_mode),
                          title: Text(languageLogic.lang.toLightMode),
                          onTap: () {
                            //themeLogic.changeToLightMode();
                            context.read<ThemeLogic>().changeToLightMode();
                          },
                          trailing: themeIndex == 1
                              ? Icon(Icons.check)
                              : null,
                        ),
                        ListTile(
                          leading: Icon(Icons.dark_mode),
                          title: Text(languageLogic.lang.toDarkMode),
                          onTap: () {
                            //themeLogic.changeToDarkMode();
                            context.read<ThemeLogic>().changeToDarkMode();
                          },
                          trailing: themeIndex == 2
                              ? Icon(Icons.check)
                              : null,
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(languageLogic.lang.language),
                      children: [
                        ListTile(
                          leading: Text("ខ្មែរ"),
                          title: Text(languageLogic.lang.changeToKhmer),
                          onTap: () {
                            languageLogic.changeToKhmer();
                          },
                          trailing: languageLogic.langIndex == 0
                              ? Icon(Icons.check)
                              : null,
                        ),
                        ListTile(
                          leading: Text("EN"),
                          title: Text(languageLogic.lang.changeToEnglish),
                          onTap: () {
                            languageLogic.changeToEnglish();
                          },
                          trailing: languageLogic.langIndex == 1
                              ? Icon(Icons.check)
                              : null,
                        ),
                                          ],
                                        ),           
                    SizedBox(height: 20),     // Add other widgets for your setting page content here
                  ],
                  
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 4, // Example: Set your selected index here
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


}
