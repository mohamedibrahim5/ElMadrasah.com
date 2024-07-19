import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/model/requests/specifiction_request.dart';
import 'package:test_project/model/requests/register_request.dart';
import 'package:test_project/shared/resources/assets_manager.dart';
import 'package:test_project/shared/resources/loading_indicator_widget.dart';
import 'package:test_project/shared/resources/navigation_service.dart';
import 'package:test_project/shared/resources/prefs_helper.dart';
import 'package:test_project/shared/resources/routes_manager.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/eighth_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/fifth_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/first_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/forth_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/second_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/seventh_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/sixth_screen.dart';
import 'package:test_project/views/register_screen/page_indecator_screen/third_screen.dart';

import '../../../model/responses/register_response.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/constant.dart';
import '../../../shared/resources/customButton.dart';
import '../../../shared/resources/service_locator.dart';
import '../../../shared/resources/utils.dart';

class RegisterPageViewScreen extends StatefulWidget {
  const RegisterPageViewScreen({super.key});

  @override
  State<RegisterPageViewScreen> createState() => _RegisterPageViewScreenState();
}

class _RegisterPageViewScreenState extends State<RegisterPageViewScreen> {
  List<Widget> itemsWidget = [
    FirstScreen(),SecondScreen(),ThirdScreen(),ForthScreen(),FifthScreen(),SixthScreen(),SeventhScreen(),EightScreen()
  ];
  late PageController pageController ;
  late UserRegisterRequest userRegisterRequest ;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (BuildContext context, state) {
        if(state is RegisterSuccessState){
          sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
            id: state.userRegisterSuccessResponse.id,
          )));
          print('lkasdlkld${state.userRegisterSuccessResponse.id}');
          sl<PrefsHelper>().setData(key: 'formId', value: state.userRegisterSuccessResponse.id);
          sl<PrefsHelper>().setData(key: 'page', value: 1);
          pageController.nextPage(duration: const Duration(
            milliseconds: 500
          ), curve: Curves.easeIn);
        }else if (state is RegisterSuccessStateSpeific){
          sl<PrefsHelper>().setData(key: 'page', value: 2);
          pageController.nextPage(duration: const Duration(
              milliseconds: 500
          ), curve: Curves.easeIn);
        }else if (state is RegisterSuccessStateAddCourse){
          sl<PrefsHelper>().setData(key: 'page', value: 3);
          pageController.nextPage(duration: const Duration(
              milliseconds: 500
          ), curve: Curves.easeIn);
        }else if (state is RegisterSuccessStateAddInfoPurposal){
          sl<PrefsHelper>().setData(key: 'page', value: 4);
          pageController.nextPage(duration: const Duration(
              milliseconds: 500
          ), curve: Curves.easeIn);
        }else if (state is RegisterSuccessStateAddPeriod){
          sl<PrefsHelper>().setData(key: 'page', value: 5);
          pageController.nextPage(duration: const Duration(
              milliseconds: 500
          ), curve: Curves.easeIn);
        }else if (state is RegisterSuccessStateSession){
          sl<PrefsHelper>().setData(key: 'page', value: 6);
          pageController.nextPage(duration: const Duration(
              milliseconds: 500
          ), curve: Curves.easeIn);
        }else if (state is RegisterSuccessStatePay){
          sl<PrefsHelper>().setData(key: 'page', value: 7);
          pageController.nextPage(duration: const Duration(
              milliseconds: 500
          ), curve: Curves.easeIn);
          setState(() {

          });

        }
      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:  REdgeInsets.symmetric(
                  horizontal: 16
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  Padding(
                    padding:  REdgeInsets.only(
                        top: 30,
                        bottom: 20
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AssetsManager.logo,width: 200.w,),
                        sl<PrefsHelper>().getPage() == 7 ? SizedBox() :
                        GestureDetector(
                          onTap: () async {
                            sl<NavigationService>().navigatePushNamedAndRemoveUntil(RoutesManager.homeScreen);
                            await sl<SharedPreferences>()
                            .setBool(Constants.showOnBoarding, true);
                            await sl<SharedPreferences>()
                                .setBool(Constants.checkRegister, true);
                            await sl<SharedPreferences>()
                                .setString('userRegisterRequest', '');
                            await sl<SharedPreferences>()
                                .setInt('page', 0);
                            await sl<SharedPreferences>()
                                .setInt('formId', 0);
                            // pageController.nextPage(duration: Duration(
                            //   seconds: 1
                            // ), curve: Curves.easeIn);
                          },
                          child: Text("تخطى",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorsManager.black
                          ),),
                        ),
                      ],
                    )
                  ),
                  Expanded(
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                          itemBuilder: (context,index){
                            return itemsWidget[index];
                          },
                        itemCount: itemsWidget.length,
                      )),
                  Padding(
                    padding:  REdgeInsets.only(
                      bottom: 30,
                      top: 20
                    ),
                    child: sl<PrefsHelper>().getPage() == 7 ?  MainButton(
                      onPressed:() async {
                        sl<NavigationService>().navigatePushNamedAndRemoveUntil(RoutesManager.homeScreen);
                        await sl<SharedPreferences>()
                            .setBool(Constants.showOnBoarding, true);
                        await sl<SharedPreferences>()
                            .setBool(Constants.checkRegister, true);
                        await sl<SharedPreferences>()
                            .setString('userRegisterRequest', '');
                        await sl<SharedPreferences>()
                            .setInt('page', 0);
                        await sl<SharedPreferences>()
                            .setInt('formId', 0);
                        // pageController.nextPage(duration: Duration(
                        //   seconds: 1
                        // ), curve: Curves.easeIn);
                      },
                      title: 'توجه الى جدولك الدراسي',
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap:(){
                                sl<NavigationService>().navigatePushNamedAndRemoveUntil(RoutesManager.homeScreen);
                                pageController.jumpToPage(0);
                                sl<PrefsHelper>().setData(key: 'page', value: 0);
                                // if(sl<PrefsHelper>().getPage() == 0){
                                //   sl<NavigationService>().popup();
                                // }else {
                                //   sl<PrefsHelper>().setData(key: 'page', value: sl<PrefsHelper>().getPage()-1);
                                //   pageController.previousPage(duration: const Duration(
                                //       milliseconds: 500
                                //   ), curve: Curves.easeIn);
                                // }
                              } ,
                              child: Container(
                                decoration: BoxDecoration(
                                    color:Colors.transparent,
                                    border: Border.all(
                                      color: ColorsManager.greenColor
                                    ),
                                    borderRadius: BorderRadiusDirectional.circular(12.r),
                                ),
                                child: Padding(
                                  padding:  REdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 18
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios,color: ColorsManager.greenColor,size: 15,),

                                      Icon(Icons.arrow_back_ios,color: ColorsManager.greenColor,size: 15,),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        'السابق',
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                          color: ColorsManager.greenColor
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),


                        SizedBox(
                          width: 8.w,
                        ),

                      state is RegisterLoadingState || state is RegisterSpecificState || state is RegisterAddCourse ? const Center(child: LoadingIndicatorWidget()) :  Expanded(
                            child: GestureDetector(
                              onTap:()async{
                                FocusManager.instance.primaryFocus?.unfocus();
                                if(sl<PrefsHelper>().getPage() == 0){
                                  RegisterCubit.get(context).register();
                                }
                                else if (sl<PrefsHelper>().getPage() == 1){
                                  
                                  RegisterCubit.get(context).spacifition(specifitionRequest: SpecifitionRequest(
                                      from: sl<PrefsHelper>().formId(),
                                      stage: RegisterCubit.get(context).stage,
                                      classRoom: RegisterCubit.get(context).classRoom,
                                      courseStudy: RegisterCubit.get(context).courseStudy
                                  ));
                                }else if (sl<PrefsHelper>().getPage() == 2) {
                                  if(RegisterCubit.get(context).selectedId.isEmpty){
                                    Utils.showToast('الرجاء اختيار موادك');
                                  }else {
                                    RegisterCubit.get(context).addCourse();
                                  }
                                }else if (sl<PrefsHelper>().getPage() == 3) {
                                  if(RegisterCubit.get(context).selectedAddtionalInfo.isEmpty){
                                    Utils.showToast('الرجاء اختيار اهدافك الدراسية');
                                  }else {
                                    RegisterCubit.get(context).addInfoPurposal();
                                  }
                                }else if (sl<PrefsHelper>().getPage() == 4) {
                                  if(RegisterCubit.get(context).selectedDays.isEmpty){
                                    Utils.showToast('الرجاء اختيار الايام المناسبة لك');
                                  }else {
                                    RegisterCubit.get(context).addPeriod();
                                  }
                                }else if (sl<PrefsHelper>().getPage() == 5) {
                                  if(RegisterCubit.get(context).subscription == null){
                                    Utils.showToast('الرجاء اختيار مدة الاشتراك');
                                  }else {
                                    RegisterCubit.get(context).addSession();
                                  }
                                }else if (sl<PrefsHelper>().getPage() == 6) {
                                  if(RegisterCubit.get(context).cardName == null || RegisterCubit.get(context).cardName == null || RegisterCubit.get(context).exDate == null || RegisterCubit.get(context).cvc == null){
                                    Utils.showToast('الرجاء تكملة جميع البيانات');
                                  }else if (RegisterCubit.get(context).checkBox == false){
                                    Utils.showToast('الرجاءالموافقة على الشروط والاحكام');
                                  }else {
                                    RegisterCubit.get(context).pay();
                                  }
                                }
                              } ,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:ColorsManager.greenColor,
                                  borderRadius: BorderRadiusDirectional.circular(12.r),
                                ),
                                child: Padding(
                                  padding:  REdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 18
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'التالى',
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),

                                      Icon(Icons.arrow_forward_ios,color: ColorsManager.whiteColor,size: 15,),

                                      Icon(Icons.arrow_forward_ios,color: ColorsManager.whiteColor,size: 15,),



                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          // ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0));

    Map userMap = jsonDecode(sl<SharedPreferences>().getString('userRegisterRequest') ?? '');
     userRegisterRequest = UserRegisterRequest.fromJson(json: userMap);
    print('flsjksflkfj${userRegisterRequest.lastName}');
    RegisterCubit.get(context).userRegisterRequest = null ;
    RegisterCubit.get(context).userRegisterRequest = userRegisterRequest ;
    pageController = PageController(
      initialPage: sl<PrefsHelper>().getPage()
    );
  }

  @override
  void dispose() {
    pageController.dispose() ;
    super.dispose();
  }

}
