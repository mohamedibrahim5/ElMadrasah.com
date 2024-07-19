import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_project/shared/resources/string_manager.dart';
import 'colors_manager.dart';
class Utils {


  static void showToast(String msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? ColorsManager.red,
        textColor: ColorsManager.whiteColor,
        fontSize: 16.0);
  }
}

