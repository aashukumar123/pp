import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pp/catalog.dart';
import 'package:pp/pages/home_widgets/catalog_List.dart';
import 'package:pp/pages/home_widgets/catalog_header.dart';
import 'dart:convert';
// import 'package:pp/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  static Color creamColor = Color(0xfff5f5ff5);
  static Color DarkBluishColor = Color(0xff403b58);

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    ); //data in string format//
    // print(catalogJson); json data is extracting
    final decodedData = jsonDecode(catalogJson);
    // print(decodedData);
    //  decoded data ...we have to map in catalog
    var productsData = decodedData["products"];
    // print(productsData);//we have only wants products
    //then after we map
    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(8, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 228),
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(
      //       "Catalog App",
      //       // style: TextStyle(),

      //       ///color: Colors.white,),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != Null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
           CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ), //Padding(                               //Vsstack in velocity intead of Column
      //   padding: const EdgeInsets.all(16.0),
      //   // ignore: unnecessary_null_comparison
      //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //        ?

      // GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       mainAxisSpacing: 16,
      //       crossAxisSpacing: 16,
      //     ),
      //     itemBuilder: (context, index) {
      //       final item = CatalogModel.items[index];
      //       return Card(
      //         clipBehavior: Clip.antiAlias,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: GridTile(header:Container(
      //           child: Text(item.name,
      //           style: TextStyle(color:Colors.white),
      //           ),
      //           padding: EdgeInsets.all(12),
      //           decoration: BoxDecoration(
      //             color: Colors.deepPurple,
      //           ),
      //         )  ,child: Image.network(item.image),
      //         footer: Container(
      //               child: Text(
      //                 item.price.toString(),
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //               padding: const EdgeInsets.all(12),
      //               decoration: BoxDecoration(
      //                 color: Colors.black,
      //               ),
      //             ),
      //         )
      //         );

      //     },
      //       itemCount: CatalogModel.items.length,

      //     // ListView.builder(
      //     //  itemCount:CatalogModel.items.length,
      //     //  itemBuilder: (context, index) =>
      //     //     ItemWidget(item: CatalogModel.items[index],),//dummyList[index]),
      //   )
      // : Center(child: CircularProgressIndicator()),
      //  ),
      // drawer: MyDrawer(),
    );
  }
}






