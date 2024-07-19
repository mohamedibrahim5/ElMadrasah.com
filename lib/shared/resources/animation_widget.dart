import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({super.key,this.xOffset,this.yOffset,required this.widget,this.delay});
  final double? xOffset ;
  final double? yOffset ;
  final Widget widget ;
  final int? delay ;
  @override
  Widget build(BuildContext context) {
    return  Entry(
        opacity: 0.1,
         xOffset:xOffset ?? 0,
        yOffset:yOffset ?? 0,
        scale: 1,
        delay:  Duration(seconds: delay ?? 0),
        duration:  Duration(seconds: 2),
        curve: Curves.easeInOut,
        child:widget
    );
  }
}
