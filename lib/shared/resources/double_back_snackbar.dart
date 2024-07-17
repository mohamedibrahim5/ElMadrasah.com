import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/shared/resources/string_manager.dart';

import 'colors_manager.dart';

SnackBar getDoubleBackSnackBar() {
  return SnackBar(
     width: 250.w,
    behavior: SnackBarBehavior.floating,
    content: Center(
      child: Text(StringsManager.doubleTapToBack,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: ColorsManager.whiteColor,
          )),
    ),
    duration: const Duration(seconds: 2),

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    backgroundColor: ColorsManager.blackColor,
  );
}
