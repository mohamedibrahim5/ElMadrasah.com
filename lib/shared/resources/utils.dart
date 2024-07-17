import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_project/shared/resources/string_manager.dart';
import 'colors_manager.dart';
class Utils {



  static String  getTimeGreetings(){


    var hour = DateTime.now().hour;
    if (hour < 12) {
      return '${StringsManager.good} ${StringsManager.morning}!';
    }
    if (hour < 17) {
      return '${StringsManager.good} ${StringsManager.afternoon}!';
    }
    return '${StringsManager.good} ${StringsManager.evening}!';

  }


  static void showToast(String msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? ColorsManager.primaryColor,
        textColor: ColorsManager.whiteColor,
        fontSize: 16.0);
  }

  static void showErrorToast(String msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? ColorsManager.errorColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSuccessToast(String msg, {Color? color}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? ColorsManager.successColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static void showSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg),duration: const Duration(seconds: 2),),
    );
  }
}

