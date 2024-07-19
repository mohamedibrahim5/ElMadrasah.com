import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/shared/resources/all_country.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../model/requests/register_request.dart';
import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/assets_manager.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/dropDown_reusable.dart';
import '../../../shared/resources/info_widget.dart';
import '../../../shared/resources/service_locator.dart';
import '../../../shared/resources/textFormFieldReusable.dart';
import '../widget/linear_indecator.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  DateTime? selectedDate ;
  bool selectDateColor = false ;
  String? gender ;
  String? country ;
  String? diff ;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  int age(DateTime dob) {
    final year = DateTime.now().year - dob.year;

    if(year > 6 ){
      return year ;
    }
    else {
      return 6 ;
    }
  }



  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          linearIndiator(
            percent: 1/8
          ),
          SizedBox(
            height: 20.h,
          ),
          AnimationWidget(
            xOffset:-20,
            widget: InFoWidget(
                color: ColorsManager.orange,
                title: 'نحن هنا لمساعدتك في رحلتك التعليمية املا بكل ثقة بيانات الاتصال الخاصة بك لتتمكن من توجيهك خطوة بخطوة'
            ) ,
          ),
      
          Padding(
            padding:  REdgeInsets.only(
                top: 12,
                bottom: 12
            ),
            child: GestureDetector(
              onTap:  () => _selectDate(context),
              child: Container(
                width: double.infinity,
                height: 52.h,
                decoration: BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                        color:selectDateColor ? ColorsManager.errorColor :  ColorsManager.greyText,
                        width: 1
                    )
                ),
                child: Padding(
                  padding:  REdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        selectedDate == null ? 'تاريخ الميلاد *' :
                        "${selectedDate?.toLocal()}".split(' ')[0],
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 12.sp
                        ),
                      ),
                      SvgPicture.asset(AssetsManager.date,matchTextDirection: true,)
                    ],
                  ),
                ),
              ),
            ),
          ),
      
          DropDownButtonReusable(
            items: ['انثى','ذكر'],
            hintText: 'الجنس *',
            onChanged: (value){
              setState(() {
      
              });
              gender = value ;
              // sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
              //   gender: gender == 'انثى' ? 'Female' : 'Male',
              // )));
              RegisterCubit.get(context).userRegisterRequest!.gender = gender == 'انثى' ? 'Female' : 'Male' ;
            },
            selectedValue: gender,
          ),
          SizedBox(
            height: 12.h,
          ),
          DropDownButtonReusable(
            search: searchController,
            items: Countries,
            hintText: 'الجنسية *',
            onChanged: (value){
              setState(() {
              });
              country = value ;
              // sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
              //   nationality: country,
              // )));
              RegisterCubit.get(context).userRegisterRequest!.nationality = country ;
            },
            selectedValue: country,

          ),
          SizedBox(
            height: 12.h,
          ),

          DropDownButtonReusable(
            items: ['نعم لدى صعوبة *','لا ليس لدى صعوبة *'],
            hintText: 'هل تواجة اى صعوبات فى الدراسة *',
            onChanged: (value){
              setState(() {

              });
              diff = value ;
              // sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
              //   difficulties: diff == 'نعم لدى صعوبة *' ? 'Yes' : 'No',
              // )));
              RegisterCubit.get(context).userRegisterRequest!.difficulties = diff == 'نعم لدى صعوبة *' ? 'Yes' : 'No' ;
            },
            selectedValue: diff,
          ),
          SizedBox(
            height: 12.h,
          ),

          CustomFormField(
            hint: 'هل ترغب فى تقديم أى ملاحظات اضافية حول احتياجاتك التعليمية أو الدعم الذى تحتاجة؟',
            //  label: StringsManager.fullName,
            controller: desController,
            filled: true,
            keyboard: TextInputType.text,
            action: TextInputAction.next,
            validator: (value){
              return null;
            },
            onChanged: (value){
              // sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
              //   description: value,
              // )));
              RegisterCubit.get(context).userRegisterRequest!.description = value ;
            },
             customContentPadding: REdgeInsets.symmetric(horizontal: 12,),
          ),

          SizedBox(
            height: 12.h,
          ),

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0));
  }
  @override
  void dispose() {
    searchController.dispose();
    desController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorsManager.greyColor, // header background color
                onPrimary: ColorsManager.blackColor, // header text color
                onSurface: ColorsManager.blackColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: ColorsManager.primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedDate ?? DateTime(2010),
        firstDate: DateTime(1970),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // sl<SharedPreferences>().setString('userRegisterRequest', jsonEncode(UserRegisterRequest(
        //   age: age(selectedDate!),
        // )));
        RegisterCubit.get(context).userRegisterRequest!.age = age(selectedDate!);
        selectDateColor = false ;
      });
    }
  }


}
