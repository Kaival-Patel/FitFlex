import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:myworkout_app/Screens/Exercise.dart';
import 'package:myworkout_app/datamodel/exercisemodes.dart';
import 'package:numberpicker/numberpicker.dart';
class Dashbaord extends StatefulWidget {
  

  @override
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  final TextStyle _lightstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0);
  final TextStyle _boldstyle=TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,fontSize: 18.0);
  NumberPicker intPicker;
  TextEditingController setController;
  Decoration _decoration = new BoxDecoration(
    border: new Border(
      top: new BorderSide(
        style: BorderStyle.solid,
        color: Colors.black26,
      ),
      bottom: new BorderSide(
        style: BorderStyle.solid,
        color: Colors.black26,
      ),
    ),
  );
  int _setcount=1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onAppExit,
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
                  Text("Fit",style:TextStyle(fontWeight: FontWeight.normal,fontFamily: "Oxygen-light",fontSize: 30.0),),
                  Text("Flex Workout App",style:TextStyle(fontWeight: FontWeight.bold,fontFamily: "Oxygen-light",fontSize: 30.0),),
                ],
              ) ,
            ), 
            gradient: LinearGradient(colors: [Color(0xFF806EDF),Color(0xFF2D1763)]),
            actions: <Widget>[
              
            ],
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
                    children: <Widget>[
                      Text("Exercise",style:_lightstyle,),
                      Text(" Modes",style:_boldstyle ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: <Widget>[
                          Expanded(
                          child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(20),
                          itemCount: modesdata.length,
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
                              onTap:(){_askforSet(modesdata[i].mode_name);},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(    
                              
                                  decoration: BoxDecoration(
                                    gradient:LinearGradient(
                                      stops: [0.0,0.5,1.0],
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors:i==0?[Color(0xffE4CAE9),Color(0xffDABCDF),Color(0xffB547C9)] : 
                                      i==1?[Color(0xffF1D5D0),Color(0xffF6BEB5),Color(0xffFC8286)]:
                                      [Color(0xffD4D9F5),Color(0xffA1A8EE),Color(0xff6268E1)]
                                    ),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      i==0?Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                child: Image(image:AssetImage("assets/img/3.png"),height: 100,width: 100),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                child: Image(image:AssetImage("assets/img/10.png"),height: 100,width: 100),
                                              ),
                                            ],
                                          ),
                                              Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                                child: Image(image:AssetImage("assets/img/8.png"),height: 100,width: 100),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                                child: Image(image:AssetImage("assets/img/4.png"),height: 100,width: 100),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                                child: Image(image:AssetImage("assets/img/5.png"),height: 100,width: 100),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
        
                                      :i==1?
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                child:Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                     
                                                    Padding(
                                                      padding: EdgeInsets.all(20),
                                                      child:Icon(Icons.calendar_today,color: Colors.white,size: 40.0,),
                                                    ),
                                                     
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(5,20.0,20.0,20.0),
                                                      child:Icon(Icons.done_all,color: Colors.white,size: 40.0,),
                                                    ),
                                                    
                                                  ],
                                                )
                                              ),
                                              
                                            ],


                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                               Image(image:AssetImage("assets/img/1.png"),height: 100,width: 80),
                                               Image(image:AssetImage("assets/img/7.png"),height: 100,width: 80),
                                               Image(image:AssetImage("assets/img/4.png"),height: 100,width: 80),
                                               Image(image:AssetImage("assets/img/14.png"),height: 100,width: 80),  
                                            ]
                                          )
                                        ]
                                      ):
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Stack(
                                                children: <Widget>[
                                                  Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                child: Image(image:AssetImage("assets/img/3.png"),height: 100,width: 100),
                                                  ),
                                                  Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                child:Icon(Icons.done,color: Colors.white,),
                                                  )
                                                  
                                                ],
                                              ),
                                              Stack(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                    child: Image(image:AssetImage("assets/img/10.png"),height: 100,width: 100),
                                                  ), 
                                                  Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
                                                child:Icon(Icons.done,color: Colors.white,),
                                                  )                                    
                                                ],
                                              ),
                                              
                                            ],
                                          ),
                                           Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                                child: Image(image:AssetImage("assets/img/8.png"),height: 100,width: 100),
                                              ),
                                            
                                              Stack(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                                    child: Image(image:AssetImage("assets/img/4.png"),height: 100,width: 100),
                                                  ),
                                                  Icon(Icons.done,color: Colors.white,),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                                child: Image(image:AssetImage("assets/img/5.png"),height: 100,width: 100),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      
                                      Divider(color: Colors.white,thickness: 1.0,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Text(modesdata[i].mode_name,style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,fontSize: 18.0,color: Colors.white),),
                                                Text(" Mode",style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0,color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.alarm,color: Colors.white,),
                                                    Text(" "+modesdata[i].mode_time.substring(0,2),style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.bold,fontSize: 18.0,color: Colors.white),),
                                                    Text(modesdata[i].mode_time.substring(2,5),style:TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0,color: Colors.white),),
                                                  ],
                                                ),
                                              )
                                            ],)
                                            ],
                                          )

                                        ],
                                      ),                   
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
              ],
            )
          ],
        ),               
      ),
    );
  }
  Future _askforSet(String modename){
    return showDialog( 
     context: context,
     child: AlertDialog(
        actions: <Widget>[

      ],
      title:Row(
        children: <Widget>[
           Text("How many ",style: _lightstyle,),
           Text("sets? ",style: _boldstyle,),
        ],

      ),
      content:Container(
        height: 185,
        child: Column(
          children: <Widget>[
            Row(
              children:<Widget>[
                 Text("Pick the number of ",style: _lightstyle,),
                 Text("sets ",style: _boldstyle,),
              ],
            ),
            intPicker=NumberPicker.horizontal(
              initialValue: _setcount,
              minValue: 1, 
              maxValue: 10,
              step: 1,
              decoration:_decoration ,
              highlightSelectedValue:false,
              onChanged:(value){
                setState(() {
                  _setcount=value;              
                });
                }
              ),
              RaisedButton(
                child: Text("Okay",style: TextStyle(fontFamily:"Oxygen-light",fontWeight:FontWeight.normal,fontSize: 18.0,color: Colors.white),), 
                color: Colors.indigo[900],
                splashColor:Colors.indigo[100] ,
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>Exercise(modename,_setcount,false)
                                ));
                }
                
                )
            
          ],   
            
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
     )
    );
  }
  Future<bool> _onAppExit(){
    SystemNavigator.pop();
  }
}
