// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/pages/home_page.dart';
// import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/login_page.dart';
import 'package:test_project/utils/routes.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.pacifico().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      // initialRoute: "/login",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }

  void bringVegetable(int thaila) {
    x = thaila;
  }
}
