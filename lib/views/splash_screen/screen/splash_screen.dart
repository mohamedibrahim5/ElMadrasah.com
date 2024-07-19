import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_project/shared/resources/colors_manager.dart';
import 'package:test_project/shared/resources/navigation_service.dart';
import 'package:test_project/shared/resources/prefs_helper.dart';
import 'package:test_project/views/home_screen/screen/home_screen.dart';
import 'package:test_project/views/register_screen/screen/register_page_view.dart';
import 'package:test_project/views/register_screen/screen/register_screen.dart';
import '../../../shared/resources/assets_manager.dart';
import '../../../shared/resources/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: AssetsManager.logo,
      centered: true,
      splashIconSize: 200.h,
      animationDuration: const Duration(
          milliseconds: 900
      ),
      backgroundColor: ColorsManager.whiteColor,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      nextScreen:sl<PrefsHelper>().checkOnBoarding() ? HomeScreen():sl<PrefsHelper>().checkOnRegister() ? RegisterScreen():RegisterPageViewScreen(),
    );
  }
}
