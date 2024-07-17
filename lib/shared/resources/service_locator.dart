import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/shared/resources/prefs_helper.dart';
import '../../data/remote/remote_datasource.dart';
import '../../data/remote/remote_datasource_impl.dart';
import '../../repository/repository.dart';
import '../../repository/repository_impl.dart';
import '../views/app_root/dark_mode_cubit/dark_mode_cubit.dart';
import 'dio_helper.dart';
import 'navigation_service.dart';
import 'network_info.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    // register helpers, datasource
    await _registerLazySingleton();

    // register cubits/blocs
    await _registerFactory();
  }
}

Future<void> _registerLazySingleton() async {
  // register dio and dio helper
  if (sl.isRegistered<Dio>()) {
    debugPrint('------------------- unregister Dio --------------------');
    sl.unregister<Dio>();
    sl.unregister<DioHelper>();
  }
  final Dio dio = DioHelper().init();
  debugPrint(
      '------------------- register Dio: ${dio.options.baseUrl} --------------------');
  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<DioHelper>(() => DioHelper());

  // register shared preferences
  if (sl.isRegistered<SharedPreferences>()) {
    sl.unregister<SharedPreferences>();
  }
  final sharedPrefs = await PrefsHelper().init();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  if (sl.isRegistered<PrefsHelper>()) {
    sl.unregister<PrefsHelper>();
  }

  sl.registerLazySingleton<PrefsHelper>(() => PrefsHelper());
  // network info
  if (sl.isRegistered<NetworkInfo>()) {
    sl.unregister<NetworkInfo>();
  }
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // navigation service
  if (sl.isRegistered<NavigationService>()) {
    sl.unregister<NavigationService>();
  }
  sl.registerLazySingleton<NavigationService>(() => NavigationService());

  // remote datasource
  if (sl.isRegistered<RemoteDataSource>()) {
    sl.unregister<RemoteDataSource>();
  }

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dio: sl(), dioHelper: sl()));

  // repositories
  if (sl.isRegistered<Repository>()) {
    sl.unregister<Repository>();
  }

  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
}

Future<void> _registerFactory() async {
  sl.registerFactory(() => ThemeCubit());

}
