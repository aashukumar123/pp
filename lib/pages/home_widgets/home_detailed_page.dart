import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailedPage extends StatelessWidget {
  final Item catalog;
 const HomeDetailedPage({Key? key, required this.catalog})
    : assert(catalog != Null),
      super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 208, 208, 220),
      body: SafeArea(
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image))
        ],).p16(),
      ),
    );
  }
}
