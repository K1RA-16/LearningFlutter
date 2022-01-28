// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_project/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Login",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/loginImage.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "User name",
                  labelText: "username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "password",
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text("login"),
              style: TextButton.styleFrom(
                minimumSize: Size(120, 30),
              ),
              onPressed: () {
                print("navigated to home page");
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
