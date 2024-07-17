import 'package:flutter/cupertino.dart';
import 'package:test_project/shared/resources/routes_manager.dart';

import '../views/splas_screen/screen/splash_screen.dart';


class AppRouter {
  // method to generate screen routes
  static Route? onGenerateRoute(RouteSettings routeSettings) {


    switch (routeSettings.name) {
      case RoutesManager.splashScreen:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>  const SplashScreen(),
        );

      default:
        return null;
    }
  }
}
