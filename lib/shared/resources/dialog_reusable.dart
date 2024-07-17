import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';

showReusableDialog({required BuildContext context,required Widget widget, double? height, double? width}) {
  showDialog(
    context: context,
    builder: (_) => ReusableCustomDialog(cubitContext: context,widget: widget,height: height,width: width),
  );
}

class ReusableCustomDialog extends StatelessWidget {
  const ReusableCustomDialog({super.key, required this.cubitContext,required this.widget,this.height, this.width});
  final BuildContext cubitContext;
  final Widget widget;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w ?? double.infinity,
      height: height,
      child: SimpleDialog(
        backgroundColor: ColorsManager.backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          contentPadding: REdgeInsets.all(20),
          children: <Widget>[
            widget,
          ]),
    );
  }
}
