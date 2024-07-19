import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/shared/resources/assets_manager.dart';
import 'package:test_project/shared/resources/colors_manager.dart';
import 'package:test_project/shared/resources/navigation_service.dart';
import 'package:test_project/shared/resources/routes_manager.dart';
import 'package:test_project/shared/resources/string_manager.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/constant.dart';
import '../../../shared/resources/customButton.dart';
import '../../../shared/resources/info_widget.dart';
import '../../../shared/resources/service_locator.dart';
import '../../../shared/resources/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectIndex ;
  @override
  Widget build(BuildContext context) {

    return
      // Directionality(
      // textDirection:sl<PrefsHelper>().getAppLanguage() == 'ar' ? TextDirection.rtl:TextDirection.rtl,
      // child:
      Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  REdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding:  REdgeInsets.only(
                          top: 100,
                          bottom: 20
                        ),
                        child: AnimationWidget(
                          yOffset:-20,
                          widget: Row(
                                children: [
                                  Text(StringsManager.newUser,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ColorsManager.greyText
                                  ),),
                                ],
                              ) ,
                        ),
                      ),
                      InFoWidget(
                         title: StringsManager.chooseLogin
                      ),
                      Padding(
                        padding:  REdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 20
                        ),
                        child: AnimationWidget(
                          xOffset: -20,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectIndex = 1 ;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                          height: 140.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.cyanAccent.withOpacity(0.4)
                                        ),
                                        child: ClipOval(child: Image.asset(AssetsManager.studentImage,width: 120.w,height: 120.h,fit: BoxFit.cover,)),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          if(selectIndex != null && selectIndex == 1 )
                                            Padding(
                                              padding:  REdgeInsets.symmetric(
                                                  horizontal: 4
                                              ),
                                              child: Container(
                                                height: 20.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: ColorsManager.greenColor,
                                                        width: 1
                                                    ),
                                                    color: Colors.transparent
                                                ),
                                                child: Center(child: Icon(Icons.check,color: ColorsManager.greenColor,size: 10,)),
                                              ),
                                            ),

                                          Text(StringsManager.student,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color:selectIndex != null && selectIndex == 1 ?ColorsManager.greenColor : ColorsManager.greyText
                                          ),),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectIndex = 0 ;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        height: 140.h,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorsManager.greyColor
                                        ),
                                        child: ClipOval(child: Image.asset(AssetsManager.parentImage,width: 120.w,fit: BoxFit.cover,)),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          if(selectIndex != null && selectIndex == 0 )
                                            Padding(
                                              padding:  REdgeInsets.symmetric(
                                                  horizontal: 4
                                              ),
                                              child: Container(
                                                height: 20.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: ColorsManager.greenColor,
                                                        width: 1
                                                    ),
                                                    color: Colors.transparent
                                                ),
                                                child: Center(child: Icon(Icons.check,color: ColorsManager.greenColor,size: 10,)),
                                              ),
                                            ),

                                          Text(StringsManager.parent,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color:selectIndex != null && selectIndex == 0 ?ColorsManager.greenColor : ColorsManager.greyText
                                          ),),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),
                      ),
                      AnimationWidget(
                        yOffset: 20,
                        widget:MainButton(
                          onPressed: () async {
                            if(selectIndex == null){
                              Utils.showToast(StringsManager.selectIndex);
                            }else {
                              sl<NavigationService>().navigateTo(RoutesManager.registerScreen,arguments: {
                                // Constants.cartItemUpdate:CartCubit.get(context).getCartModel?.items?[index],
                                // Constants.indexOfItem : index
                              });
                               await sl<SharedPreferences>()
                                  .setBool(Constants.showOnBoarding, false);
                            }
                          },
                          title: StringsManager.next,
                        ) ,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  REdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: Center(
                    child: IntrinsicWidth(
                      child: Column(
                        children: [

                          RichText(
                            // Controls visual overflow
                            overflow: TextOverflow.clip,

                            // Controls how the text should be aligned horizontally
                            textAlign: TextAlign.center,

                            // Control the text direction

                            // Whether the text should break at soft line breaks
                            softWrap: true,

                            // Maximum number of lines for the text to span
                            maxLines: 4,

                            // The number of font pixels for each logical pixel

                            text: TextSpan(
                              text: "هل لديك حساب ؟ ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 14.sp, height: 1.7,),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "تسجيل الدخول",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 14.sp, height: 1.7,color: ColorsManager.greenColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding:  REdgeInsets.symmetric(
                              horizontal: 16
                            ),
                            child: Container(
                               height: 8.h,
                              // width: 8.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color:ColorsManager.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
     // ),
    );
  }
}
