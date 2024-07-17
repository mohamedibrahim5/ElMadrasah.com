import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/shared/resources/string_manager.dart';

Widget instractionPassword({
  required BuildContext context
}){
  return Padding(
    padding:  REdgeInsets.only(
        top: 8,
        bottom: 16
    ),
    child: Text.rich(
        TextSpan(
            children: [
              TextSpan(text: StringsManager.must,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12.sp
              )),
              TextSpan(
                  text: StringsManager.must2,
                  style: Theme.of(context).textTheme.displaySmall
              ),
              TextSpan(text: StringsManager.must3,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12.sp
              )),
              TextSpan(
                  text: StringsManager.must4,
                  style: Theme.of(context).textTheme.displaySmall
              ),
              TextSpan(text: StringsManager.must5,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12.sp
              )),
              TextSpan(
                  text: StringsManager.must6,
                  style: Theme.of(context).textTheme.displaySmall
              ),
            ]
        )
    ),
  );
}