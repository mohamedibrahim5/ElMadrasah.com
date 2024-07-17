import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key,required this.onPressed,required this.title});
  final Function() onPressed;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell (
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onPressed,
            child: Padding(
              padding:  REdgeInsets.only(
                right: 16,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).canvasColor,
                size: 24.sp,
              ),
            )
        ),
        Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp
            )
        ),
        GestureDetector(
            onTap: (){
            },
            child: Padding(
              padding:  REdgeInsets.only(
                left: 16,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
                size: 24.sp,
              ),
            )
        ),
      ],
    );
  }
}
