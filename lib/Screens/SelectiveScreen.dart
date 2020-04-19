import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:myworkout_app/datamodel/randomexlist.dart';
class SelectiveScreen extends StatefulWidget {
  @override
  _SelectiveScreenState createState() => _SelectiveScreenState();
}


class _SelectiveScreenState extends State<SelectiveScreen> {
  TextEditingController searchController;
  List<randomexelist> bodylist;
  List<bool> checklist=new List<bool>();
  var searchresult=List<randomexelist>();
  Color floatingbtncolor=Color(0xFF806EDF);
  List<Color> bordercolor=List<Color>();
  List<randomexelist> usercheckedlist=List<randomexelist>();
  @override
  void initState(){
    super.initState();
    bodylist=randomlist;
    searchresult.addAll(bodylist);
    for(int i=0;i<bodylist.length;i++){
      checklist.add(false);
      bordercolor.add(Colors.white);
    }
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
                  Text("Selective",style:TextStyle(fontWeight: FontWeight.normal,fontFamily: "Oxygen-light",fontSize: 30.0),),
                  Text(" Mode",style:TextStyle(fontWeight: FontWeight.bold,fontFamily: "Oxygen-light",fontSize: 30.0),),
                ],
              ) ,
            ), 
            gradient: LinearGradient(colors: [Color(0xFF806EDF),Color(0xFF2D1763)]),
            
          ),
        ),
        floatingActionButton: Builder(
            builder: (BuildContext bcontext){
              return  FloatingActionButton.extended(
            onPressed:(){
              if(usercheckedlist.length>4){
              for(int i=0;i<usercheckedlist.length;i++){
                print("-->ITEMS TO LIST:${usercheckedlist[i].exercisename}\n");
              }
              print("----------------");
              }
              else{
                SnackBar snackBar=SnackBar(
                  content: Text("Please select atleast five exercises to start!",style: TextStyle(color: Color(0xffdfd6f5),fontWeight: FontWeight.bold,fontFamily: "Oxygen-light" ),)
                );
                Scaffold.of(bcontext).showSnackBar(snackBar);
              }
              
            }, 
            label:Row(
              children: <Widget>[
                Text("Let's ",style: TextStyle(fontWeight: FontWeight.normal),),
                Text("Workout",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            backgroundColor: floatingbtncolor ,
            hoverColor: Colors.red,
            icon: Icon(Icons.play_arrow),
            );
            },
           
        ),
        body:Container(
          child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Color(0xFF2D1763),
                  controller:searchController ,
                  onChanged:(searchstring){
                    _onSearched(searchstring);
                  },
                  enableSuggestions:true,
                  decoration: InputDecoration(
                    suffixIcon:Icon(Icons.search) ,
                    labelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    labelText: "Search",
                    focusColor: Color(0xFF2D1763),
                    fillColor: Color(0xFF2D1763),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xFF2D1763) ),
                      borderRadius: BorderRadius.circular(10),  
                    )
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF2D1763)
                    
                  ),

                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: Row(
                        children: <Widget>[
                          Text("Select any 5 "),
                          Text("Exercises",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: Row(
                        children: <Widget>[
                          Text("Selected : "),
                          Text("${usercheckedlist.length}/${searchresult.length}",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchresult.length,
                  itemBuilder: (context,i)=>Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.grey[200],
                        offset: Offset(1.0,15.0),
                      )]),
                      child:GestureDetector(
                        onTap:(){
                        setState(() {
                          if(checklist[i]==true){
                            checklist[i]=false;
                            usercheckedlist.remove(searchresult[i]);
                            bordercolor[i]=Colors.white;
                          }
                          else{
                            checklist[i]=true;
                            usercheckedlist.add(searchresult[i]);
                            bordercolor[i]=Color(0xFF806EDF);
                          }
                          if(usercheckedlist.length>4){
                            floatingbtncolor=Color(0xFF2D1763);
                          }
                          else{
                            floatingbtncolor=Color(0xFF806EDF);
                          }
                        });
                        } ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                                border:Border.all(color:bordercolor[i]),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    //rleft: 50,
                                    child:Align(
                                      alignment: Alignment.center,
                                        child: Opacity(
                                        opacity: 0.3,
                                        child:  Image(
                                         image: AssetImage(
                                                        searchresult[i].exercisename=="Stretches"?"assets/img/4.png"
                                                        :searchresult[i].exercisename=="Pushups"?"assets/img/1.png"
                                                        :searchresult[i].exercisename=="Bench Press"?"assets/img/12.png"
                                                        :searchresult[i].exercisename=="Yoga Ball"?"assets/img/8.png"
                                                        :searchresult[i].exercisename=="Balance"?"assets/img/5.png"
                                                        :searchresult[i].exercisename=="Tadasana"?"assets/img/9.png"
                                                        :"assets/img/6.png"
                                                      ),
                                          height: 100,
                                          width: 100,            
                                         
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      
                                      Text(searchresult[i].exercisename,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                                      Checkbox(
                                        value: checklist[i],
                                        onChanged: (checked){
                                          setState(() {
                                            checklist[i]=checked;
                                            if(checked){
                                              usercheckedlist.add(searchresult[i]);
                                              bordercolor[i]=Color(0xFF806EDF);
                                            }
                                            else{
                                              usercheckedlist.remove(searchresult[i]);
                                              bordercolor[i]=Colors.white;
                                            }
                                            if(usercheckedlist.length>4){
                                              floatingbtncolor=Color(0xFF2D1763);
                                            }
                                            else{
                                              floatingbtncolor=Color(0xFF806EDF);
                                            }
                                          });
                                          print("CHECKBOX STATUS:${checked}");
                                        },
                                        activeColor:Color(0xFF2D1763) ,
                                        checkColor: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                ],
                              ),
                            ),
                        ),
                      ) ,
                    ),
                  ),
                ), 
            ],
          )
        ), 
        )
      );
  }
  void _onSearched(String searchString){
    List<randomexelist> searchlist=new List<randomexelist>();
    searchlist.addAll(bodylist);
    if(searchString.isNotEmpty){
      List<randomexelist> resultlist=new List<randomexelist>();
      for(int i=0;i<searchlist.length;i++){
        if(searchlist[i].exercisename.toLowerCase().contains(searchString.toLowerCase())){
          resultlist.add(searchlist[i]);
        }
      }
      setState(() {
        searchresult.clear();
        searchresult.addAll(resultlist);
      });
      return;
    }
    else{
      setState(() {
        searchresult.clear();
        searchresult.addAll(bodylist);
      });
    }
  }
  Future<bool> _onAppExit(){
    Navigator.pop(context);
    
  }
}