import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp/home.dart';
import 'package:pp/login_page.dart';
import 'package:pp/utils/routes.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      primaryTextTheme:GoogleFonts.latoTextTheme()),
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // initialRoute: "/home",
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoute: (context)=> HomePage(),//"/home":(context)=> HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),

      },
     
    );
  }
}