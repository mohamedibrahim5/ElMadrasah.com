import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/shared/resources/blocObserver.dart';
import 'package:test_project/shared/resources/service_locator.dart';
import 'package:test_project/shared/views/app_root/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:test_project/shared/views/app_root/screen/app_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await ServiceLocator.init();

  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();


  runApp(EasyLocalization(startLocale:const Locale('en') ,
    supportedLocales: const [Locale('ar'), Locale('en')],
    path: 'assets/translation',
    fallbackLocale: const Locale('en'),
    saveLocale: true,

    child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<ThemeCubit>()),
        ],
        child: const AppRoot()),
  ));
}