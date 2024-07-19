import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_project/shared/resources/routes_manager.dart';
import 'package:test_project/views/home_screen/screen/home_screen.dart';
import 'package:test_project/views/register_screen/screen/register_screen.dart';
import 'package:test_project/views/splash_screen/screen/splash_screen.dart';

import '../../views/register_screen/screen/register_page_view.dart';



class AppRouter {
  // method to generate screen routes
  static Route? onGenerateRoute(RouteSettings routeSettings) {


    switch (routeSettings.name) {
      case RoutesManager.splashScreen:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>  const SplashScreen(),
        );

      case RoutesManager.registerScreen:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>  const RegisterScreen(),
        );

      case RoutesManager.registerPageViewScreen:
        return CupertinoPageRoute(builder:(_) => RegisterPageViewScreen(),settings: routeSettings);


      case RoutesManager.homeScreen:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>  const HomeScreen(),
        );


      default:
        return null;
    }
  }
}
