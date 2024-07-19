import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/shared/resources/string_manager.dart';
import 'constant.dart';
import 'service_locator.dart';

class PrefsHelper {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
// Create storage


  Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sl<SharedPreferences>().setString(key, value);
    } else if (value is int) {
      return await sl<SharedPreferences>().setInt(key, value);
    } else if (value is bool) {
      return await sl<SharedPreferences>().setBool(key, value);
    } else if (value is double) {
      return await sl<SharedPreferences>().setDouble(key, value);
    } else if (value is List<String>) {
      return await sl<SharedPreferences>().setStringList(key, value);
    } else {
      return false;
    }
  }





  bool checkOnBoarding() {
    return sl<SharedPreferences>().getBool(Constants.showOnBoarding) ?? true;
  }

  bool checkOnRegister() {
    return sl<SharedPreferences>().getBool(Constants.checkRegister) ?? true;
  }







  int getPage(){
    return sl<SharedPreferences>().getInt('page') ?? 0;
  }

  int formId(){
    return sl<SharedPreferences>().getInt('formId') ?? 0;
  }









  String getTheme(){

    String theme = sl<SharedPreferences>().getString(Constants.theme) ?? '';

    return theme;
  }

}
