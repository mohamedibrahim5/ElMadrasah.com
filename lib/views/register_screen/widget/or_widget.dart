import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/shared/resources/colors_manager.dart';

class OrWidget extends StatefulWidget {
  const OrWidget({Key? key}) : super(key: key);

  @override
  State<OrWidget> createState() => _OrWidgetState();
}

class _OrWidgetState extends State<OrWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.only(bottom: 20.0,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: ColorsManager.greyText,
            ),
          ),
          Text(' أو تسجيل الدخول باستخدام ',
              style:
                  TextStyle(
                      color: ColorsManager.greyText,
                      fontSize: 16)),
          Expanded(
            child: Container(
              height: 1,
              color: ColorsManager.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
