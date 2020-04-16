import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:myworkout_app/Screens/CountDown/AnimatedTimer.dart';
import 'package:myworkout_app/datamodel/randomexlist.dart';
import 'dart:async';
import 'dart:math' as math;
class Exercise extends StatefulWidget {
  final String exercisemode;
  final bool isexeStarted;
  final int setcount;
  Exercise(this.exercisemode,this.setcount,this.isexeStarted);
  @override
  _ExerciseState createState() => _ExerciseState(exercisemode,setcount,isexeStarted);
}



class _ExerciseState extends State<Exercise> with TickerProviderStateMixin {
  final GlobalKey<AnimatedTimerState> animatedStateKey1 = GlobalKey<AnimatedTimerState>();
  final GlobalKey<AnimatedTimerState> animatedStateKey2 = GlobalKey<AnimatedTimerState>();
  final GlobalKey<AnimatedTimerState> animatedStateKey3 = GlobalKey<AnimatedTimerState>();
  final GlobalKey<AnimatedTimerState> animatedStateKey4 = GlobalKey<AnimatedTimerState>();
  String exercisemode;
  int setcount;
  Timer _timer;
  int _popMaxValue=3;
  bool isExeStarted;
  final TextStyle _lightstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0);
  final TextStyle _boldstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,fontSize: 18.0);
  _ExerciseState(this.exercisemode,this.setcount,this.isExeStarted);
  
  //define Controller
  // AnimationController exercisecontroller4,exercisecontroller,exercisecontroller2,exercisecontroller3;
   


  @override
  void initState(){
    super.initState();
    // isExeStarted?animatedStateKey1.currentState.STATUS_CODE=1:
    // animatedStateKey1.currentState.STATUS_CODE=0;
    
          // : animatedStateKey.currentState.animationController!=null?
          // animatedStateKey.currentState.animationController.stop():null;
          //animatedStateKey.currentState.animationController.stop();  
    //initialise controller
    // exercisecontroller2=AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 60)
    // );
    // exercisecontroller=AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 60)
    // );
    // isExeStarted?exercisecontroller.reverse(
    // from: exercisecontroller.value == 0.0
    //       ? 1.0
    //       : exercisecontroller.value)
    //       :exercisecontroller.stop();
    // exercisecontroller.isCompleted?exercisecontroller2.reverse(
    // from: exercisecontroller2.value == 0.0
    //       ? 1.0
    //       : exercisecontroller2.value)
    //       :exercisecontroller2.stop();      
          
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onAppExit,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize:Size.fromHeight(70),
            child: GradientAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70)
            ),  
            leading: Padding(
              padding: EdgeInsets.only(top:12),
              child: IconButton(
              icon: Icon(Icons.arrow_back,color:Colors.white,size: 30.0,),
              onPressed: _onAppExit,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top:10),
              child: Row(
                  children: <Widget>[  
                  Text(exercisemode,style:TextStyle(fontWeight: FontWeight.normal,fontFamily: "Oxygen-light",fontSize: 30.0),),
                  Text(" Mode",style:TextStyle(fontWeight: FontWeight.bold,fontFamily: "Oxygen-light",fontSize: 30.0),),
                ],
              ) ,
            ), 
            gradient: LinearGradient(colors: [Color(0xFF806EDF),Color(0xFF2D1763)]),
            
          ),
        ),
        body: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 8.0, 8.0, 1.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Text("Exercise",style:_lightstyle,),
                            Text(" List",style:_boldstyle ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 0.0, 8.0, 1.0),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed:(){
                                return showDialog(context: context,
                                barrierDismissible: false,
                                child: PopDialog(timer:_timer,popMaxValue: _popMaxValue,exercisemode: exercisemode,setcount: setcount,)
                              );
                              },
                              icon: Icon(Icons.play_circle_outline,color: Colors.teal,size: 30,),
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),]),
              Column(
              children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: <Widget>[
                          Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            
                          ],
                        ),
                      ),
                          Expanded(
                          child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(20),
                          itemCount: randomlist.length,
                          itemBuilder:(context,i)=>
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color:Colors.grey[200],
                                blurRadius:10.0,
                                offset: Offset(1.0,8.0),
                              )],
                            ),
                            child: GestureDetector(
                              onTap:(){
                                
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(    
                                  decoration: BoxDecoration(
                                    gradient:LinearGradient(
                                      stops: [0.0,1.0],
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors:i==0?[Color(0xff85DBAA),Color(0xff20B8A1)] : 
                                      i==1?[Color(0xffFAC871),Color(0xffFF9229)]:
                                      i==2?[Color(0xff80D4FB),Color(0xff12A4E8)]:
                                      [Color(0xffFBB1A8),Color(0xffF26851)]
                                    ),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                             Container(
                                               height: 150,
                                               child:
                                               isExeStarted?i==0?AnimatedTimer(
                                                 key:animatedStateKey1,
                                                 statuscode:1,
                                                 duration:60,color:Color(0xff135438)
                                               ):i==1?AnimatedTimer(
                                                 key:animatedStateKey2,
                                                 statuscode:1,
                                                 duration:60,color:Color(0xff78400A)
                                               ):i==2?AnimatedTimer(
                                                 key:animatedStateKey3,
                                                 statuscode:1,
                                                 duration:60,color:Color(0xff08425D)
                                               ):AnimatedTimer(
                                                 key:animatedStateKey4,
                                                 statuscode:1,
                                                 duration:60,color:Color(0xff9F3624)
                                               )
                                               :
                                               i==0?AnimatedTimer(
                                                 key:animatedStateKey1,
                                                 statuscode:0,
                                                 duration:60,color:Color(0xff135438)
                                               ):i==1?AnimatedTimer(
                                                 key:animatedStateKey2,
                                                 statuscode:0,
                                                 duration:60,color:Color(0xff78400A)
                                               ):i==2?AnimatedTimer(
                                                 key:animatedStateKey3,
                                                 statuscode:0,
                                                 duration:60,color:Color(0xff08425D)
                                               ):AnimatedTimer(
                                                 key:animatedStateKey4,
                                                 statuscode:0,
                                                 duration:60,color:Color(0xff9F3624)
                                               )
                                             ),
                                      
                                                // Padding(
                                                //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                                //   child:_countdownTimer
                                                //   // child: Column(
                                                //   //   children: <Widget>[
                                                //   //     Align(
                                                //   //         alignment: FractionalOffset.center,
                                                //   //         child: AspectRatio(
                                                //   //           aspectRatio: 1.0,
                                                //   //           child: Stack(
                                                //   //             children: <Widget>[
                                                //   //               Positioned.fill(
                                                //   //               child: AnimatedBuilder(
                                                //   //                 animation: exercisecontroller,
                                                //   //                 builder: (BuildContext context,Widget child)=>
                                                //   //                 CustomPaint(
                                                //   //                   painter: CustomTimerPainter(
                                                //   //                     animation: exercisecontroller,
                                                //   //                     backgroundColor: Colors.white,
                                                //   //                     color:Color(0xff135438),
                                                //   //                   ),
                                                //   //                 )
                                                //   //                 ,
                                                //   //               )
                                                //   //               ),
                                                //   //               Align(
                                                //   //                 alignment: FractionalOffset.center,
                                                //   //                 child: Column(
                                                //   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                //   //                   crossAxisAlignment: CrossAxisAlignment.center,
                                                //   //                   children: <Widget>[
                                                //   //                     AnimatedBuilder(
                                                //   //                       animation: exercisecontroller, 
                                                //   //                       builder: (BuildContext context,Widget child)=>
                                                //   //                       Text(timerString,style: TextStyle(fontSize: 20,color:Color(0xff135438)),)
                                                //   //                       )
                                                //   //                   ],
                                                //   //                 ),
                                                //   //               )
                                                //   //             ],
                                                //   //           ),
                                                //   //         ),
                                                //   //       ),
              
                                                //   //     AnimatedBuilder(
                                                //   //       animation: exercisecontroller,
                                                //   //       builder: (context, child) {
                                                //   //         return FloatingActionButton.extended(
                                                //   //             onPressed: () {
                                                //   //               if (exercisecontroller.isAnimating)
                                                //   //                 exercisecontroller.stop();
                                                //   //               else {
                                                //   //                 exercisecontroller.reverse(
                                                //   //                     from: exercisecontroller.value == 0.0
                                                //   //                         ? 1.0
                                                //   //                         : exercisecontroller.value);
                                                //   //               }
                                                //   //             },
                                                //   //             icon: Icon(exercisecontroller.isAnimating
                                                //   //                 ? Icons.pause
                                                //   //                 : Icons.play_arrow),
                                                //   //             label: Text(
                                                //   //                 exercisecontroller.isAnimating ? "Pause" : "Play"));
                                                //   //       }),
                                                //   //   ],
                                                //   // ),
                                                // ),
                                                
                                                ],
                                              ),
                                            ]
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ),
                            )
                          )
                        ], 
                      ),
                    ),
              ],
            )
          ]
        ),
      )
     );
     
  }
  
  Future<bool> _onAppExit(){
    Navigator.pop(context);
  }
  
   
  }


class PopDialog extends StatefulWidget {
  Timer timer;
  int popMaxValue;
  String exercisemode;
  int setcount;


  PopDialog({this.timer,this.popMaxValue,this.exercisemode,this.setcount});
  @override
  _PopDialogState createState() => _PopDialogState();
  
}

class _PopDialogState extends State<PopDialog> {
  final GlobalKey<AnimatedTimerState> animatedStateKey = GlobalKey<AnimatedTimerState>();
  int _popMaxValue=3;
  Timer _timer;
  @override
  void initState(){
    playCountdown();
    startTimer(widget.exercisemode,widget.setcount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async=>false,
          child: AlertDialog(
          title: Text('Be Ready to Flex in:',),
          content: Container(
            height: 70,
            child:Text("$_popMaxValue",style: TextStyle(fontSize: 30,color: Colors.redAccent[700],fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            
          ),
      ),
    );
    
    
  }
  //play final countdown on load
  Future<AudioPlayer> playCountdown() async{
    print("PLAYING SOUND!!!");
    AudioCache cache=new AudioCache();
    return await cache.play("audio/final_countdown.mp3");
  }

  Future startTimer(String exercisemode,int setcount){
      const onesec=const Duration(seconds: 1);
      _timer=new Timer.periodic(onesec,(Timer timer)=>setState(() {
        if(_popMaxValue<=1){
          timer.cancel();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>Exercise(exercisemode,setcount,true),
          ));
         
          // animatedStateKey.currentState.animationController.reverse(
          // from: animatedStateKey.currentState.animationController.value == 0.0
          //       ? 1.0
          //       : animatedStateKey.currentState.animationController.value);

        }
        else{
          print("$_popMaxValue");
          if(mounted){
          setState(() {
            _popMaxValue=_popMaxValue-1;
          });
          }
         
        }
      })
      );
    
    }
  
}

