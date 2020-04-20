import 'package:audioplayers/audio_cache.dart';
import '../RandomScreen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'CustomTimerPainter.dart';
    class AnimatedTimer extends StatefulWidget {
      int duration;
      Color color;
      int statuscode;
      int setcount;
      AnimationController animationController;
      int animationcount;
      AnimatedTimer({this.duration,this.animationcount,this.color,this.statuscode,this.setcount});
      @override
      AnimatedTimerState createState() => AnimatedTimerState(this.duration,this.color,this.statuscode,this.setcount);
    }

    class AnimatedTimerState extends State<AnimatedTimer> with TickerProviderStateMixin {
      int duration,animationcount;
      Color color;
      int statuscode,setcount;
      bool isExerciseCompleted=false;
      AudioPlayer audioPlayer;
      final int BREAK_TIME=40;
      AnimatedTimerState(this.duration,this.color,this.statuscode,this.setcount);
      AnimationController animationController,animationController2,animationController3,animationController4,animationController5,animationController6,animationController7;
      String get timerString0 {
        Duration duration = animationController.duration * animationController.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
      String get timerString1 {
        Duration duration = animationController2.duration * animationController2.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
      String get timerString2 {
        Duration duration = animationController3.duration * animationController3.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
      String get timerString3 {
        Duration duration = animationController4.duration * animationController4.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
      String get timerString4 {
        Duration duration = animationController5.duration * animationController5.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
       String get timerString5 {
        Duration duration = animationController6.duration * animationController6.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
       String get timerString6 {
        Duration duration = animationController7.duration * animationController7.value;
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }

      @override
      void initState(){
        super.initState();
        Wakelock.enable();
        animationcount=widget.animationcount;
        print("NO OF ANIMATIONS TO SHOW:${animationcount}");
        print("IN THE INIT STATE with sets:${setcount}");
        audioPlayer=new AudioPlayer();
        animationController=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
        animationController2=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
        animationController3=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
        animationController4=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
        animationController5=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
        animationController6=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
        animationController7=AnimationController(
          vsync: this,
          duration: Duration(
            seconds: duration
          )
        );
         if(statuscode!=5){
          updateAnimation();
         }
      }

      void updateAnimation(){
         for(int i=0;i<setcount;i++){ 
          print("CONTROLLING THE ANIMTION::!!");
          audioPlayer.stop();
          playSong("ashes.mp3");
          animationController.reverse(
          from: animationController.value == 0.0
              ? 1.0
              : animationController.value).whenComplete((){
              audioPlayer.stop();
              breakDialog();
              animationController.stop();

              //break
              Future.delayed(Duration(seconds: BREAK_TIME),(){
              //remove break dialog  
              Navigator.pop(context);

              playSong("rock1.mp3");


              animationController2.reverse(
              from: animationController2.value == 0.0
              ? 1.0
              : animationController2.value).whenComplete((){
                audioPlayer.stop();
                breakDialog();

                 //break
                Future.delayed(Duration(seconds: BREAK_TIME),(){
                Navigator.pop(context);
                playSong("rock2.mp3");
                animationController3.reverse(
                from: animationController3.value == 0.0
                ? 1.0
                : animationController3.value).whenComplete((){
                  audioPlayer.stop();
                  breakDialog();

                  //break
                  Future.delayed(Duration(seconds: BREAK_TIME),(){
                  //remove break dialog 
                  Navigator.pop(context);
                   playSong("rock3.mp3");
                  animationController4.reverse(
                  from: animationController4.value == 0.0
                  ? 1.0
                  : animationController4.value).whenComplete((){
                    audioPlayer.stop();
                    breakDialog();

                  //break
                  Future.delayed(Duration(seconds: BREAK_TIME),(){
                  //remove break dialog 
                  Navigator.pop(context);
                  playSong("joined audio.mp3");
                  animationController5.reverse(
                  from: animationController5.value == 0.0
                  ? 1.0
                  : animationController5.value).whenComplete((){
                    if(animationcount==6){
                    audioPlayer.stop();
                    breakDialog();
                  //break
                    Future.delayed(Duration(seconds: BREAK_TIME),(){
                    //remove break dialog 
                    Navigator.pop(context);
                    playSong("joined audio.mp3");
                    animationController6.reverse(
                    from: animationController6.value == 0.0
                    ? 1.0
                    : animationController6.value).whenComplete((){
                      if(animationcount==6){
                    audioPlayer.stop();
                    breakDialog();
                  //break
                    Future.delayed(Duration(seconds: BREAK_TIME),(){
                    //remove break dialog 
                    Navigator.pop(context);
                    playSong("joined audio.mp3");
                    animationController7.reverse(
                    from: animationController7.value == 0.0
                    ? 1.0
                    : animationController7.value).whenComplete((){
                      finishDialog();
                      setState(() {
                      audioPlayer.stop();
                      isExerciseCompleted=true;
                      });

                    });
                    
                    });
                    }
                    else{
                      finishDialog();
                      setState(() {
                      audioPlayer.stop();
                      isExerciseCompleted=true;
                      });
                    }

                    });
                    
                    });
                    }
                    else{
                      finishDialog();
                      setState(() {
                      audioPlayer.stop();
                      isExerciseCompleted=true;
                      });
                    }
                  
                  });
                });
              });
            });
          });
         });          
      });
    });
  });
}
}
        Future breakDialog() async{
          showDialog(
              barrierDismissible: false,
              context: context,
              child: AlertDialog(
                content: Text("Take A Break of 40 seconds, This will automatically disappear once the break is over!"),
                title: Text("BREAK",style: TextStyle(fontWeight: FontWeight.bold),),
                actions: <Widget>[
                  Center(
                    child: Image(image: AssetImage("assets/gif/break1.gif"),),
                  )
                ],
              )
              );
        }
        Future finishDialog() async{
          showDialog(
              barrierDismissible: false,
              context: context,
              child: AlertDialog(
                content: Text("Hurray ! You just burned approx 150 calories. KEEP IT UP!!"),
                title: Text("Finished Workout"),
                actions: <Widget>[
                  Center(
                    child: Image(image: AssetImage("assets/gif/finished_workout.gif"),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Return",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      color: Colors.teal,

                    
                    ),
                  )
                ],
              )
          );
          
        }

        Future<AudioPlayer> playSong(String songname) async{
        print("PLAYING SOUND!!!");   
        AudioCache cache=new AudioCache(fixedPlayer: audioPlayer);        
        return await cache.play("audio/"+songname);
        }
      

      @override
      void dispose(){
        animationController.dispose();
        animationController2.dispose();
        animationController3.dispose();
        animationController4.dispose();
        animationController5.dispose();
        audioPlayer.stop();
        print("DISPOSED OFF!!");
        super.dispose();
      }


      @override
      Widget build(BuildContext context) {
        return AnimatedBuilder(
      animation:statuscode==0?animationController
      :statuscode==1?animationController2
      :statuscode==2?animationController3
      :animationController4,
     
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
                            animation:statuscode==0?animationController
                                    :statuscode==1?animationController2
                                    :statuscode==2?animationController3
                                    :statuscode==3?animationController4
                                    :animationController5,
                            builder:
                                (BuildContext context, Widget child) {
                              return CustomPaint(
                                  painter: CustomTimerPainter(
                                animation:statuscode==0?animationController
                                :statuscode==1?animationController2
                                :statuscode==2?animationController3
                                :statuscode==3?animationController4
                                    :animationController5,
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
                                  animation:statuscode==0?animationController
                                  :statuscode==1?animationController2
                                  :statuscode==2?animationController3
                                  :statuscode==3?animationController4
                                    :animationController5,
                                  builder: (BuildContext context,
                                      Widget child) {
                                    return Text(
                                      statuscode==0?timerString0
                                      :statuscode==1?timerString1
                                      :statuscode==2?timerString2
                                      :statuscode==3?timerString3
                                      :timerString4,
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