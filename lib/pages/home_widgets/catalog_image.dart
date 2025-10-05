import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image})
    : assert(image != Null),
      super(key: key);
 
  
  @override
  Widget build(BuildContext context) {
    return Image.network(
          image,
    ).box.rounded.p8.color(const Color.fromARGB(255, 238, 229, 229)).make().p16().w40(context);
  }
}