import 'package:flutter/material.dart';

 class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("catalog app"),
     ),
        body: Center(
          child: Container(
            child: const Text("welcome"),
          ),
        ),
        drawer: Drawer(),
    );
  }
} 