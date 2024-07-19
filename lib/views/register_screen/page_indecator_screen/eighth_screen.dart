import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/info_widget.dart';
import '../widget/linear_indecator.dart';
import 'package:lottie/lottie.dart';

class EightScreen extends StatelessWidget {
  const EightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        linearIndiator(
          percent: 8/8
        ),
        SizedBox(
          height: 20.h,
        ),
        AnimationWidget(
          yOffset: -20,
          widget: InFoWidget(
              color: ColorsManager.orange,
              title:
              'شكرا على ثقتك بنا نحن في انتظارك لنبدا معا رحلة تعلم ملهمة ومثمرة'),
        ),
        SizedBox(
          height: 12.h,
        ),
        Expanded(child: Center(child: Lottie.asset('assets/lottie/Animation - 1721421872950.json'))),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8
          ),
          child: Center(
            child: Text('تم الدفع بنجاح',style: TextStyle(
              color: ColorsManager.greenColor
            ),),
          ),
        ),
        Center(
          child: Text('شكرا لك علي ثقتك في المدرسة دوت كوم',style: TextStyle(
              color: ColorsManager.greenColor.withOpacity(0.5)
          ),),
        ),
        
        //
      ],
    );
  }
}
