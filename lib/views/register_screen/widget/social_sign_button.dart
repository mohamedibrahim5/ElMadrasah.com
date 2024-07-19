import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/shared/resources/colors_manager.dart';

class SocialSignButton extends StatefulWidget {
  const SocialSignButton({Key? key, required this.image, required this.txt,}) : super(key: key);
final String image;
final String txt;
  @override
  State<SocialSignButton> createState() => _SocialSignButtonState();
}

class _SocialSignButtonState extends State<SocialSignButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border:
                    Border.all(width: 1.5, color: ColorsManager.greenColor),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding:  REdgeInsets.symmetric(
                vertical: 8
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  Text(
                    widget.txt,
                    style: TextStyle(
                      color: ColorsManager.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 4.w),

                  Center(
                    child: SvgPicture.asset(
                      widget.image,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
