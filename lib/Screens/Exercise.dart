import 'dart:math';
import 'package:myworkout_app/Widgets/PopDialog.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:myworkout_app/Screens/CountDown/AnimatedTimer.dart';
import 'package:myworkout_app/datamodel/randomexlist.dart';
import 'dart:async';
import 'package:wakelock/wakelock.dart';
import 'package:after_layout/after_layout.dart';


class Exercise extends StatefulWidget {
  final String exercisemode;
  final int setcount;
  bool exestarted;
  List<randomexelist> generatedList;
  
  Exercise({this.exercisemode,this.setcount,this.exestarted,this.generatedList});
  @override
  _ExerciseState createState() => _ExerciseState(exercisemode,setcount,exestarted,generatedList);


  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    showHelloWorld(context);
  }
  void showHelloWorld(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
            content: new Text('Hello World'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('DISMISS'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
    );
  }
}



class _ExerciseState extends State<Exercise> with TickerProviderStateMixin {
  // final GlobalKey<AnimatedTimerState> animatedStateKey1 = GlobalKey<AnimatedTimerState>();
  // final GlobalKey<AnimatedTimerState> animatedStateKey2 = GlobalKey<AnimatedTimerState>();
  // final GlobalKey<AnimatedTimerState> animatedStateKey3 = GlobalKey<AnimatedTimerState>();
  // final GlobalKey<AnimatedTimerState> animatedStateKey4 = GlobalKey<AnimatedTimerState>();
  String exercisemode;
  //AnimationController controller1,controller2,controller3,controller4;
  int setcount;
  Timer _timer;
  final int BREAK_TIME=40;
  int _popMaxValue=3;
  int breakMaxValue=40;
  bool exestarted;
  List<randomexelist> generatedList;

  final TextStyle _lightstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0);
  final TextStyle _boldstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,fontSize: 18.0);
  _ExerciseState(this.exercisemode,this.setcount,this.exestarted,this.generatedList);
  
  
  

  @override
  void initState(){
    super.initState();
    
    var rng=new Random();
    if(!exestarted){
    generatedList=List<randomexelist>();
        while(generatedList.length<5){
        int randomnum = rng.nextInt(6);
        print("RANDOM NUMBER:${randomnum}");
        if(!generatedList.contains(randomlist[randomnum])){
            //add exercise 
            generatedList.add(randomlist[randomnum]);
        }
        
        
        } 
    }
    else{
          generatedList=widget.generatedList;

    }

     
    for(int i=0;i<generatedList.length;i++){
      print("LIST:${generatedList[i].exercisename}");
    }
    print("LIST GENERATED with length:${generatedList.length}");
          
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
                                if(!exestarted){
                                return showDialog(context: context,
                                barrierDismissible: false,
                                //to start in 3 2 1 go 
                                child: PopDialog(timer:_timer,popMaxValue: _popMaxValue,exercisemode: exercisemode,setcount: setcount,generatedlist: generatedList,)
                                );
                              }
                              else{

                              }
                              },
                              icon:!exestarted?Icon(Icons.play_circle_outline,color: Colors.teal,size: 30,)
                              :Icon(Icons.accessibility_new,color: Colors.teal,size:30)
                              ,
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
                          itemCount: generatedList.length,
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
                                padding: const EdgeInsets.only(bottom:10,left:3,right:3),
                                child: Container(    
                                  decoration: BoxDecoration(
                                    gradient:LinearGradient(
                                      stops: [0.0,1.0],
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors:i==0?[Color(0xff85DBAA),Color(0xff20B8A1)] : 
                                      i==1?[Color(0xffFAC871),Color(0xffFF9229)]:
                                      i==2?[Color(0xff80D4FB),Color(0xff12A4E8)]:
                                      i==3?[Color(0xffFBB1A8),Color(0xffF26851)]:
                                      [Color(0xffC6A8FB),Color(0xff8A4CF8)]
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
                                               child:exestarted?DelayedDisplay(
                                                 child: i==0?AnimatedTimer(color:
                                                 i==0?
                                                 Color(0xff135438)
                                                 :i==1?Color(0xff78400A) 
                                                 :i==2?Color(0xff08425D)
                                                 :i==3?Color(0xff9F3624)
                                                 :Color(0xff4F2991)                                                
                                                 ,duration: generatedList[i].time,statuscode: 0,setcount: setcount,)
                                                        :i==1?new AnimatedTimer(color:i==0?
                                                          Color(0xff135438)
                                                          :i==1?Color(0xff78400A) 
                                                          :i==2?Color(0xff08425D)
                                                          :i==3?Color(0xff9F3624)
                                                          :Color(0xff4F2991)
                                                           ,duration:generatedList[i].time,statuscode: 1,setcount: setcount)
                                                        :i==2?AnimatedTimer(
                                                          color:i==0?
                                                          Color(0xff135438)
                                                          :i==1?Color(0xff78400A) 
                                                          :i==2?Color(0xff08425D)
                                                          :i==3?Color(0xff9F3624)
                                                          :Color(0xff4F2991)
                                                           ,duration:generatedList[i].time,statuscode: 2,setcount: setcount)
                                                        :i==3?AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :Color(0xff4F2991)
                                                         ,duration:generatedList[i].time,statuscode: 3,setcount: setcount)
                                                        :AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :Color(0xff4F2991)
                                                         ,duration:generatedList[i].time,statuscode: 4,setcount: setcount) 
                                                         ,
                                                 delay: i==0?Duration(seconds: 0):
                                                        i==1?Duration(seconds: generatedList[i].time+BREAK_TIME):
                                                        i==2?Duration(seconds: (generatedList[i].time+BREAK_TIME)*2):
                                                        i==3?Duration(seconds: (generatedList[i].time+BREAK_TIME)*3):
                                                        Duration(seconds: (generatedList[i].time+BREAK_TIME)*4)
                                               ):
                                               DelayedDisplay(
                                                        child: i==0?AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :Color(0xff4F2991) ,duration:generatedList[i].time,statuscode: 5,setcount: setcount,)
                                                        :i==1?new AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :Color(0xff4F2991) ,duration:generatedList[i].time,statuscode: 5,setcount: setcount)
                                                        :i==2?AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :Color(0xff4F2991) ,duration:generatedList[i].time,statuscode: 5,setcount: setcount)
                                                        :AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :Color(0xff4F2991) ,duration:generatedList[i].time,statuscode: 5,setcount: setcount),
                                                 delay: i==0?Duration(seconds: 0):
                                                        i==1?Duration(seconds: 0):
                                                        i==2?Duration(seconds: 0):
                                                        Duration(seconds: 0)
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
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                child: Column(
                                                  children: <Widget>[
                                                    Center(child: Text(generatedList[i].exercisename,style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,color:Colors.white,fontSize: 22.0),)),
                                                    Container(
                                                      width:80,
                                                      child:Center(child: Text(generatedList[i].exercisebenefits,style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,color:Colors.white,fontSize: 12.0),))

                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                child: Column(
                                                  children: <Widget>[
                                                    Center(
                                                      child: Image(image: AssetImage(
                                                        generatedList[i].exercisename=="Stretches"?"assets/img/4.png"
                                                        :generatedList[i].exercisename=="Pushups"?"assets/img/1.png"
                                                        :generatedList[i].exercisename=="Bench Press"?"assets/img/12.png"
                                                        :generatedList[i].exercisename=="Yoga Ball"?"assets/img/8.png"
                                                        :generatedList[i].exercisename=="Balance"?"assets/img/5.png"
                                                        :generatedList[i].exercisename=="Tadasana"?"assets/img/9.png"
                                                        :"assets/img/6.png"
                                                      ),
                                                      height:generatedList[i].exercisename=="Bench Press"?55.0:80.0,
                                                      width:generatedList[i].exercisename=="Bench Press"?55.0:80.0,
                                                      ),
                                                    ),
                                                    
                                                  ],
                                                ),
                                              )
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




// class AnimateClock extends StatefulWidget {
//   Color color;
//   int duration;
//   AnimateClock({this.color,this.duration});
//   @override
//   _AnimateClockState createState() => _AnimateClockState(this.color,this.duration);
// }




// class _AnimateClockState extends State<AnimateClock> {
//   Color _color;
//   Timer _timer;
//   int duration;
//   _AnimateClockState(this._color,this.duration);
//   @override
//   void initState(){
//   super.initState();
//   startTimer(_timer,duration);
 
// }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedTimer(
//       color:_color,
//       duration: duration,
//     );
//   }
//   Future startTimer(Timer _timer,int duration){
//       const onesec=const Duration(seconds: 1);
//       _timer=new Timer.periodic(onesec,(Timer timer)=>setState(() {
//         if(duration<=1){
//           timer.cancel();
//           print("FIRST ANIMATION COMPLETED!!");
         
//           // animatedStateKey.currentState.animationController.reverse(
//           // from: animatedStateKey.currentState.animationController.value == 0.0
//           //       ? 1.0
//           //       : animatedStateKey.currentState.animationController.value);

//         }
//         else{
//           print("$duration");
//           if(mounted){
//           setState(() {
//             duration=duration-1;
//           });
//           }
         
//         }
//       })
//       );
    
//     }
// }