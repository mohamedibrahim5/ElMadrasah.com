import 'package:flutter/material.dart';
import 'package:test_project/views/app_root/dark_mode_cubit/dark_mode_cubit.dart';

import 'colors_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoadingIndicatorWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final bool isCircular;

  const LoadingIndicatorWidget({super.key, this.color, this.size,this.isCircular = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 40,
        height: size ?? 40,
        child: Center(
          child:isCircular ? LoadingAnimationWidget.inkDrop(
            color:ThemeCubit.get(context).isDark? ColorsManager.greenColor:ColorsManager.greenColor,
            size: 40,
          ) : LoadingAnimationWidget.prograssiveDots(
            color:ThemeCubit.get(context).isDark? ColorsManager.greenColor:ColorsManager.greenColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}

