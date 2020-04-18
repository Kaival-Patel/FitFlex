import 'dart:async';
import 'package:flutter/material.dart';
import '../datamodel/randomexlist.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import '../Screens/Exercise.dart';
import 'package:wakelock/wakelock.dart';
class PopDialog extends StatefulWidget {
  Timer timer;
  int popMaxValue;
  String exercisemode;
  int setcount;
  List<randomexelist> generatedlist;


  PopDialog({this.timer,this.popMaxValue,this.exercisemode,this.setcount,this.generatedlist});
  @override
  _PopDialogState createState() => _PopDialogState(this.popMaxValue,this.generatedlist);
  
}

class _PopDialogState extends State<PopDialog> {
  int _popMaxValue;
  Timer _timer;
  List<randomexelist> generatedlist;
  _PopDialogState(this._popMaxValue,this.generatedlist);
  @override
  void initState(){
    playCountdown();
    print("SIZE OF GENERATED LIST IN POP DIALOG:${generatedlist.length}");
    startTimer(widget.exercisemode,widget.setcount,widget.generatedlist);
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

  Future startTimer(String exercisemode,int setcount,List<randomexelist> randomexelist){
      const onesec=const Duration(seconds: 1);
      _timer=new Timer.periodic(onesec,(Timer timer)=>setState(() {
        if(_popMaxValue<=1){
          print("AFTER TIMER:LENGTH:=>${randomexelist.length}");
          timer.cancel();
          Navigator.pop(context);
          Navigator.pop(context);
          Wakelock.enable();
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>Exercise(exercisemode: exercisemode,exestarted: true,setcount: setcount,generatedList: randomexelist,),
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