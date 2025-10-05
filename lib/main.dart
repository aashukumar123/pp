import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp/home.dart';
import 'package:pp/login_page.dart';
import 'package:pp/utils/routes.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily:GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        
        // color: Colors.white,
        elevation: 0.0,
        
        iconTheme: IconThemeData(color:Colors.black),
        // textTheme:Theme.of(context).textTheme,
      )),
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute:MyRoutes.homeRoute,
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoute: (context)=> HomePage(),//"/home":(context)=> HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),

      },
     
    );
  }
}