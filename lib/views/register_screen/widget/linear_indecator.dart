import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test_project/shared/resources/colors_manager.dart';
Widget linearIndiator({required double percent}){
  return  LinearPercentIndicator(
    widgetIndicator: Container(
      color: Colors.white,
      height: 20,
      width: 20,
    ),
    animateFromLastPercent: true,
    // width: 140,
    lineHeight: 14.0,
    percent: percent,
    animation: true,
    isRTL: true,
    alignment:MainAxisAlignment.start,
    addAutomaticKeepAlive: true,
    barRadius: Radius.circular(10),
    backgroundColor: ColorsManager.greyText,
    progressColor: ColorsManager.greenColor,

  );
}