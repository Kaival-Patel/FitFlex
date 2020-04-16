import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'CustomTimerPainter.dart';
class AnimatedTimer extends StatefulWidget {
  int duration;
  Color color;
  int statuscode;
  AnimatedTimer({this.duration,this.color,Key key,this.statuscode}):super(key:key);
  @override
  AnimatedTimerState createState() => AnimatedTimerState(this.duration,this.color,this.key,this.statuscode);
}

class AnimatedTimerState extends State<AnimatedTimer> with TickerProviderStateMixin {
  int duration;
  Color color;
  GlobalKey key;
  int statuscode;
  AnimatedTimerState(this.duration,this.color,this.key,this.statuscode);
  AnimationController animationController;
  String get timerString {
    Duration duration = animationController.duration * animationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  @override
  void initState(){
    super.initState();
    key=GlobalKey();
    print("IN THE INIT STATE!");
    animationController=AnimationController(
      vsync: this,
      duration: Duration(
        seconds: duration
      )
    );
    print('STATE OF KEY ${key.hashCode}');
    if(statuscode==1){
      updateAnimation();
    }
    else{
      if(animationController!=null){
        animationController.stop();
      }
    }
        
    
  }

  void updateAnimation(){
    print("CONTROLLING THE ANIMTION::!!");
    animationController.reverse(
    from: animationController.value == 0.0
          ? 1.0
          : animationController.value).whenComplete((){
            print("COMPLETED!!");
          });
    //animationController.stop();
    animationController.addStatusListener((status){
      print("STATUS OF ANIMATION:${status}");
    }); 
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
  animation:animationController,
  builder: (context, child) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Align(      
              alignment: FractionalOffset.center,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child:
                      AnimatedBuilder(
                        animation: animationController,
                        builder:
                            (BuildContext context, Widget child) {
                          return CustomPaint(
                              painter: CustomTimerPainter(
                            animation: animationController,
                            backgroundColor: Colors.white,
                            color:color
                          ));
                        },
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                            CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          AnimatedBuilder(
                              animation: animationController,
                              builder: (BuildContext context,
                                  Widget child) {
                                return Text(
                                  timerString,
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color:color
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),     
        ],
      ),
    );
  });
  }
}