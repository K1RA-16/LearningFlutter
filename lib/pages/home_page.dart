// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/main.dart';
import 'dart:convert';
import 'package:test_project/models/catalog.dart';
import 'package:test_project/utils/theme.dart';
import 'package:test_project/widget/drawer.dart';
import 'package:test_project/widget/itemWidget.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyThemes.cream,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ],
              )),
        ),
      ),
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

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final Items catalog = CatalogModel.items[index];
        return CatalogItems(catalog: catalog);
      },
    );
  }
}

class CatalogItems extends StatelessWidget {
  final Items catalog;

  const CatalogItems({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.bold.lg.make(),
                catalog.desc.text.textStyle(context.captionStyle!).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Buy".text.bold.make(),
                      style: ElevatedButton.styleFrom(
                        primary: MyThemes.darkBluish,
                        shape: const StadiumBorder(),
                      ),
                    ).pOnly(right: 8),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ).white.roundedSM.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .rounded
        .color(MyThemes.cream)
        .make()
        .p8()
        .w32(context);
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.color(MyThemes.darkBluish).bold.xl5.make(),
          "Trending Products".text.make(),
        ],
      ),
    );
  }
}
