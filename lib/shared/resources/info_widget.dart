import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';

class InFoWidget extends StatelessWidget {
  const InFoWidget({super.key,this.color,required this.title});
  final Color? color ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
      child: Row(
        children: [
          Container(
            // height: 90.h,
            width: 8.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color:color ??  ColorsManager.greenColor,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),

          Expanded(
            child: Padding(
              padding:  REdgeInsets.symmetric(
                  vertical: 4
              ),
              child: Text(title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.basicButton,
                  height: 1.5
              ),),
            ),
          ),

        ],
      ),
    );
  }
}
