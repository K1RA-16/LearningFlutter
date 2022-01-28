// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:test_project/main.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("catalog app"),
    ),
        body: Center(
          child: Container(
            child: Text("welcome $x"),
          ),
        ),
        drawer: const Drawer(),
    );
  }
} 