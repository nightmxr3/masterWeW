import 'package:flutter/material.dart';
import 'package:recipes/screens/home.dart';
import 'package:recipes/screens/new_page.dart';
import 'package:recipes/screens/next_page.dart';
import 'package:recipes/screens/hargaLadang.dart';
import 'package:recipes/screens/hargaBorong.dart';
import 'package:recipes/screens/hargaRuncit.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FAMA APPS',
      theme: ThemeData(
        primaryColor: Color(0xff263341),
        accentColor: Color(0xff8DB646),
      ),
      home: HomePage(),
     routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => new NewPage("NewPage"),
        "/b": (BuildContext context) => new NextPage("NextPage"),
        "/c": (BuildContext context) => new LadangPage("LadangPage"),
        "/d": (BuildContext context) => new BorongPage("BorongPage"),
        "/e": (BuildContext context) => new RuncitPage("RuncitPage"),
     });
  }
  
}
