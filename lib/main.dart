import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/shared/resources/blocObserver.dart';
import 'package:test_project/shared/resources/service_locator.dart';
import 'package:test_project/views/app_root/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:test_project/views/app_root/screen/app_root.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bloc observer to handle state print for cubit to know immediately bloc
  Bloc.observer = MyBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // service locator to register network and bloc and take one object for any class
  await ServiceLocator.init();
  // screen util to handle responsive screen
  await ScreenUtil.ensureScreenSize();
  // handle language to all application
  await EasyLocalization.ensureInitialized();


  runApp(EasyLocalization(startLocale:const Locale('ar') ,
    supportedLocales: const [Locale('ar'), Locale('en')],
    path: 'assets/translation',
    fallbackLocale: const Locale('ar'),
    saveLocale: true,

    child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<ThemeCubit>()),
          BlocProvider(create: (context) => sl<RegisterCubit>()),
        ],
        child: const AppRoot()),
  ));
}