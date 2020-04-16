import 'package:flutter/material.dart';
import 'Dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Splash screen after 3 sec it will start new screen
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>Dashbaord(),
      ));
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //logo
          Center(
            child: Image(image: AssetImage("assets/img/lco_logo.png"),),
          ),
          //gif logo
          Image(image: AssetImage("assets/gif/gym1.gif"),)
        ],
      ),
    );
  }
}