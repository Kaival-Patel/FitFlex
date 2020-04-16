import 'package:flutter/material.dart';
import 'Screens/Home.dart';

void main()=>runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitFlex',
      theme: ThemeData(fontFamily: "Oxygen-light"),
      home: Home(),
    );
  }
}