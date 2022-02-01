// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/main.dart';
import 'dart:convert';
import 'package:test_project/models/catalog.dart';
import 'package:test_project/widget/drawer.dart';
import 'package:test_project/widget/itemWidget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "catalog app",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: CatalogModel.items[index]);
        },
      ),
      drawer: MyDrawer(),
    );
  }

  loadJson() async {
    var json = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(json);
    var productJson = decodedData["products"];
    CatalogModel.items = List.from(productJson)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }
}
