import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_project/shared/resources/prefs_helper.dart';
import 'package:test_project/shared/resources/routes_manager.dart';
import 'package:test_project/shared/resources/service_locator.dart';
import 'package:test_project/shared/resources/string_manager.dart';
import 'package:test_project/shared/resources/utils.dart';

import 'constant.dart';
import 'navigation_service.dart';

class DioHelper {
  Dio init() {
    final dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 1 * 30),
        validateStatus: (state) {
          return state! < 500;
        }));
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true, requestHeader: true, responseHeader: true));
    return dio;
  }




  void removeHeader() {
    sl<Dio>().options.headers = {};
  }

}
