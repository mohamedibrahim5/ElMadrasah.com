import 'package:flutter/foundation.dart';

void printFunc({
  bool printing = false,
  required String printName
}){
  if(printing){
    if (kDebugMode) {
      print(printName);
    }
  }

}