// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_null_comparison

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
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: GridTile(
                    header: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.amber,
                      child: Text(
                        item.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: Image.network(item.image),
                    footer: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.black,
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
              itemCount: CatalogModel.items.length,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }

  loadJson() async {
    await Future.delayed(const Duration(seconds: 1));
    var json = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(json);
    var productJson = decodedData["products"];
    CatalogModel.items = List.from(productJson)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }
}
