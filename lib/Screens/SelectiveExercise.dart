import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:myworkout_app/Screens/CountDown/AnimatedTimer.dart';
import 'package:myworkout_app/datamodel/randomexlist.dart';
class SelectiveExercise extends StatefulWidget {
  List<randomexelist> bodylist;

  SelectiveExercise({this.bodylist});
  @override
  _SelectiveExerciseState createState() => _SelectiveExerciseState(this.bodylist);
}

class _SelectiveExerciseState extends State<SelectiveExercise> {
  List<randomexelist> bodylist;
  int setcount=1;
  int BREAK_TIME=40;
  _SelectiveExerciseState(this.bodylist);
  final TextStyle _lightstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0);
  final TextStyle _boldstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,fontSize: 18.0);

  @override
  void initState(){
    super.initState();
    bodylist=widget.bodylist;
    print("LEN OF BODYLIST:${bodylist.length}");
  }

  @override
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
                  Text("Selective",style:TextStyle(fontWeight: FontWeight.normal,fontFamily: "Oxygen-light",fontSize: 30.0),),
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
                                
                              },
                              icon:Icon(Icons.accessibility_new,color: Colors.teal,size:30)
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
                          itemCount: bodylist.length,
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
                                      i==4?[Color(0xffC6A8FB),Color(0xff8A4CF8)]:
                                      i==5?[Color(0xff8BE35D),Color(0xff3D5133)]:
                                      [Color(0xffF7B5FC),Color(0xffC819D5)]
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
                                               child:DelayedDisplay(
                                                 child: i==0?AnimatedTimer(color:
                                                 i==0?
                                                 Color(0xff135438)
                                                 :i==1?Color(0xff78400A) 
                                                 :i==2?Color(0xff08425D)
                                                 :i==3?Color(0xff9F3624)
                                                 :Color(0xff4F2991)                                                
                                                 ,duration: bodylist[i].time,statuscode: 0,setcount: setcount,)
                                                        :i==1?new AnimatedTimer(color:i==0?
                                                          Color(0xff135438)
                                                          :i==1?Color(0xff78400A) 
                                                          :i==2?Color(0xff08425D)
                                                          :i==3?Color(0xff9F3624)
                                                          :i==4?Color(0xff4F2991)
                                                          :i==5?Color(0xff1A3E06)
                                                          :Color(0xff691470)
                                                           ,duration:bodylist[i].time,animationcount: bodylist.length,statuscode: 1,setcount: setcount)
                                                          :i==2?AnimatedTimer(
                                                          color:i==0?
                                                          Color(0xff135438)
                                                          :i==1?Color(0xff78400A) 
                                                          :i==2?Color(0xff08425D)
                                                          :i==3?Color(0xff9F3624)
                                                          :i==4?Color(0xff4F2991)
                                                        :i==5?Color(0xff1A3E06)
                                                        :Color(0xff691470)
                                                           ,duration:bodylist[i].time,animationcount: bodylist.length,statuscode: 2,setcount: setcount)
                                                        :i==3?AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :i==4?Color(0xff4F2991)
                                                        :i==5?Color(0xff1A3E06)
                                                        :Color(0xff691470)
                                                         ,duration:bodylist[i].time,animationcount: bodylist.length,statuscode: 3,setcount: setcount)
                                                        :AnimatedTimer(color:i==0?
                                                        Color(0xff135438)
                                                        :i==1?Color(0xff78400A) 
                                                        :i==2?Color(0xff08425D)
                                                        :i==3?Color(0xff9F3624)
                                                        :i==4?Color(0xff4F2991)
                                                        :i==5?Color(0xff1A3E06)
                                                        :Color(0xff691470)
                                                         ,duration:bodylist[i].time,animationcount: bodylist.length,statuscode: 4,setcount: setcount) 
                                                         ,
                                                 delay: i==0?Duration(seconds: 0):
                                                        i==1?Duration(seconds: bodylist[i].time+BREAK_TIME):
                                                        i==2?Duration(seconds: (bodylist[i].time+BREAK_TIME)*2):
                                                        i==3?Duration(seconds: (bodylist[i].time+BREAK_TIME)*3):
                                                        i==4?Duration(seconds: (bodylist[i].time+BREAK_TIME)*4):
                                                        i==5?Duration(seconds: (bodylist[i].time+BREAK_TIME)*5):
                                                        Duration(seconds: (bodylist[i].time+BREAK_TIME)*6)
                                               )

                                                     
                                             ),

                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                child: Column(
                                                  children: <Widget>[
                                                    Center(child: Text(bodylist[i].exercisename,style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,color:Colors.white,fontSize: 22.0),)),
                                                    Container(
                                                      width:80,
                                                      child:Center(child: Text(bodylist[i].exercisebenefits,style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,color:Colors.white,fontSize: 12.0),))

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
                                                        bodylist[i].exercisename=="Stretches"?"assets/img/4.png"
                                                        :bodylist[i].exercisename=="Pushups"?"assets/img/1.png"
                                                        :bodylist[i].exercisename=="Bench Press"?"assets/img/12.png"
                                                        :bodylist[i].exercisename=="Yoga Ball"?"assets/img/8.png"
                                                        :bodylist[i].exercisename=="Balance"?"assets/img/5.png"
                                                        :bodylist[i].exercisename=="Tadasana"?"assets/img/9.png"
                                                        :"assets/img/6.png"
                                                      ),
                                                      height:bodylist[i].exercisename=="Bench Press"?55.0:80.0,
                                                      width:bodylist[i].exercisename=="Bench Press"?55.0:80.0,
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