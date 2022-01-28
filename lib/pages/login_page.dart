// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Text(
            "login",
            style: TextStyle(
              fontSize: 40,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
