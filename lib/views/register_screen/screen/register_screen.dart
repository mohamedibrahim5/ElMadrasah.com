import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/shared/resources/navigation_service.dart';
import 'package:test_project/shared/resources/routes_manager.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../model/requests/register_request.dart';
import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/constant.dart';
import '../../../shared/resources/customButton.dart';
import '../../../shared/resources/phone.field.dart';
import '../../../shared/resources/service_locator.dart';
import '../../../shared/resources/string_manager.dart';
import '../../../shared/resources/textFormFieldReusable.dart';
import '../../../shared/resources/utils.dart';
import '../../../shared/resources/validation.dart';
import '../widget/or_widget.dart';
import '../widget/social_sign_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController _firstNameController ;
  late TextEditingController _lastNameController ;
  late TextEditingController _emailController ;
  late TextEditingController _passwordController ;
  late TextEditingController _confirmPasswordController ;

  late final FocusNode phoneNode;
  String errorTextName = '';
  late TextEditingController _phoneController ;
  PhoneNumber? phoneNumber ;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  REdgeInsets.symmetric(
                horizontal: 16
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[
                    Padding(
                      padding:  REdgeInsets.only(
                          top: 40,
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

                    AnimationWidget(
                      widget: CustomFormField(
                        hint: StringsManager.firstName,
                        //  label: StringsManager.fullName,
                        controller: _firstNameController,
                        filled: true,
                        keyboard: TextInputType.text,
                        action: TextInputAction.next,
                        validator: (value){
                          return CustomValidation.nameValidation(value,errorTextName);
                        },
                      ),
                      xOffset: -100,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AnimationWidget(
                      widget: CustomFormField(
                        hint: StringsManager.lastName,
                        //  label: StringsManager.fullName,
                        controller: _lastNameController,
                        filled: true,
                        keyboard: TextInputType.text,
                        action: TextInputAction.next,
                        validator: (value){
                          return CustomValidation.nameValidation(value,errorTextName);
                        },
                      ),
                      xOffset: -200,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    AnimationWidget(
                      widget: PhoneField(
                        focusNode: phoneNode,
                        controller: _phoneController,
                        onChange: (value) {
                          phoneNumber = value ;
                        },
                        label: "",
                        placeholder: "e.g. 915981847",
                        validator: CustomValidation.phoneValidator,
                        action: TextInputAction.next,
                      ),
                      xOffset: -300,

                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    AnimationWidget(
                      widget: CustomFormField(
                        hint: StringsManager.emailAddress,
                        //  label: StringsManager.fullName,
                        controller: _emailController,
                        filled: true,
                        keyboard: TextInputType.text,
                        action: TextInputAction.next,
                        validator: (value){
                          return CustomValidation.emailValidation(value,errorTextName);
                        },
                      ),
                      xOffset: -400,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    AnimationWidget(
                      widget: CustomFormField(
                        hint: StringsManager.password,
                        //  label: StringsManager.fullName,
                        controller: _passwordController,
                        filled: true,
                        keyboard: TextInputType.text,
                        action: TextInputAction.next,
                        validator: (value){
                          return CustomValidation.passwordValidation(value,error: errorTextName);
                        },
                      ),
                      xOffset: -500,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AnimationWidget(
                      widget: CustomFormField(
                        hint: StringsManager.confirmPassword,
                        //  label: StringsManager.fullName,
                        controller: _confirmPasswordController,
                        filled: true,
                        keyboard: TextInputType.text,
                        action: TextInputAction.done,
                        validator: (value){
                          return CustomValidation.confirmPasswordValidation(value);
                        },
                      ),
                      xOffset: -600,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),

                    AnimationWidget(
                      yOffset: 20,
                      widget:MainButton(
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            if(phoneNumber == null || phoneNumber!.number.isEmpty){
                              Utils.showToast(StringsManager.addPhone);
                            }else{
                              // RegisterCubit.get(context).userRegisterRequest = UserRegisterRequest(
                              //   email: _emailController.text,
                              //   lastName: _lastNameController.text,
                              //   firstName: _firstNameController.text,
                              //   phone: '${phoneNumber!.countryCode}${phoneNumber!.number}',
                              //   // nationality: RegisterCubit.get(context).country
                              // );
                              sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
                                email: _emailController.text,
                                lastName: _lastNameController.text,
                                firstName: _firstNameController.text,
                                phone: '${phoneNumber!.countryCode}${phoneNumber!.number}',
                                // nationality: RegisterCubit.get(context).country
                              )));
                              sl<NavigationService>().navigateTo(RoutesManager.registerPageViewScreen);
                              await sl<SharedPreferences>().setBool(Constants.checkRegister, false);
                              // register first step her
                            }
                          }
                        },
                        title: StringsManager.newUser,
                      ) ,
                    ),
                    const OrWidget(),
                    const SocialSignButton(
                      txt: 'Google',
                      image:'assets/images/google.svg' ,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const SocialSignButton(
                      txt: 'Apple',
                      image:'assets/images/apple.svg' ,
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
          ),
        ),
        // ),
      );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(
      seconds: 0
    ));
    _firstNameController = TextEditingController();
    _phoneController = TextEditingController();
    phoneNode = FocusNode();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneController.dispose();
    phoneNode.dispose();
    _lastNameController.dispose() ;
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
