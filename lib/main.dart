// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_project/pages/home_page.dart';
// import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

int x = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bringVegetable(2);
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.indigo),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home":(context) => Homepage(),
        "/login" :(context) => LoginPage(),
      },
    );
  }

  void bringVegetable(int thaila) {
    x = thaila;
  }
}
