import 'package:flutter/material.dart';
import 'package:pp/catalog.dart';
import 'package:pp/pages/home_widgets/catalog_image.dart';
import 'package:pp/pages/home_widgets/home_detailed_page.dart';
import 'package:velocity_x/velocity_x.dart';
class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //expand size shrink in column
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailedPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  // ignore: use_super_parameters
  const CatalogItem({Key? key, required this.catalog})
    : assert(catalog != Null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         Hero(//its gave me share transation
         tag: Key(catalog.id.toString()),//tag are used to gave animation simantiously of two thing of differant page.
           child: CatalogImage(image: catalog.image,
           ),
         ),
         Expanded(child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
    catalog.name.text.lg.bold.make(),
    catalog.desc.text.textStyle(context.captionStyle).make(),
    10.heightBox,
    OverflowBar(
      
      alignment: MainAxisAlignment.spaceBetween,
     
      
       children: [
       
      
      "\$${catalog.price}".text.bold.xl.make(),
      
      Padding(
        padding: const EdgeInsets.only(right: 10.0,top: 10.0),
        child: ElevatedButton(onPressed: (){},
        style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
        ),
        
         child: "buy".text.make()),
      )

    ],)//.pOnly(right: 8.0)
   ],
         ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}
