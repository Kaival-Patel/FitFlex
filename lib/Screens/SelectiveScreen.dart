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
  var searchresult=List<randomexelist>();
  @override
  void initState(){
    super.initState();
    bodylist=randomlist;
    searchresult.addAll(bodylist);
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
              Expanded(
                child: ListView.builder(
                  itemCount: searchresult.length,
                  itemBuilder: (context,i)=>ListTile(
                    enabled: true,
                    leading: Icon(Icons.data_usage),
                    title: Text(searchresult[i].exercisename,),
                    trailing: Checkbox(
                      checkColor: Color(0xFF2D1763),
                      onChanged:(value){
                        
                      },
                      value: true,
                    ),
                  ),
                ),
              )
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