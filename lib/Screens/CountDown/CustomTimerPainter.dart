import 'package:flutter/material.dart';
import 'dart:math' as math;
class CustomTimerPainter extends CustomPainter{
  CustomTimerPainter(
    {
      this.animation,
      this.backgroundColor,
      this.color,
    }
  ) : super(repaint:animation);
  final Animation<double>animation;
  final Color backgroundColor,color;
  @override
  void paint(Canvas canvas,Size size){
    Paint paint=Paint()
    ..color=backgroundColor
    ..strokeWidth=8.0
    ..strokeCap=StrokeCap.butt
    ..style=PaintingStyle.stroke;
    double radius=math.min(size.width/3,size.width/3);
    
    //draw the circle
    canvas.drawCircle(size.center(Offset.zero),radius, paint);
    paint.color=color;
    double progress=(1.0-animation.value)*2* math.pi;
    canvas.drawArc(Rect.fromCircle(center:size.center(Offset.zero),radius: radius), math.pi*1.5, -progress, false, paint);
  }
  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

}