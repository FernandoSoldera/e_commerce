import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/my_advertisement.dart';
import 'package:e_commerce/screens/profile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    saveLocale: true,
    path: 'assets/i18n',
    supportedLocales: [
      Locale('en', 'US'),
      Locale('pt', 'BR'),
    ],
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    MyAdvertisement(),
    Profile(),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromARGB(50, 153, 51, 255),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Color.fromARGB(255, 153, 51, 255),
          iconSize: 24,
          selectedIconTheme: IconThemeData(size: 30),
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'.tr().toString(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_mall),
              label: 'my_advertisement'.tr().toString(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile'.tr().toString(),
            ),
          ],
          onTap: onTap,
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}
