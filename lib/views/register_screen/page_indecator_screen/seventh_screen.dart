import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/info_widget.dart';
import '../../../shared/resources/textFormFieldReusable.dart';
import '../../../shared/resources/validation.dart';
import '../widget/linear_indecator.dart';

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController date = TextEditingController() ;
  final TextEditingController pin = TextEditingController() ;
  final TextEditingController name = TextEditingController();
  String errorTextName = '' ;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RegisterCubit,RegisterState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              linearIndiator(
                  percent: 7/8
              ),
              SizedBox(
                height: 20.h,
              ),
              AnimationWidget(
                yOffset: -20,
                widget: InFoWidget(
                    color: ColorsManager.greenColor,
                    title:
                    'استعد للتعلم والتطور معنا,وقم بالدفع بكل سهولة للبدء في رحلتك الرائعة نحو التعليم الممتع والمفيد'),
              ),
              SizedBox(
                height: 12.h,
              ),
              AnimationWidget(
                widget: InFoWidget(
                    color: ColorsManager.greenColor,
                    title:'${RegisterCubit.get(context).price ?? '650'}درهم  '
                      )),

              SizedBox(
                height: 12.h,
              ),

              Container(
                height: 55.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: ColorsManager.greenColor,
                    width: 1.5
                  )
                ),
                child: Padding(
                  padding:  REdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.ac_unit,color: ColorsManager.greenColor,),
                          Padding(
                            padding:  REdgeInsets.only(right: 4.0,left: 30),
                            child: Text('بطاقة اتمان'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/images/visa1.svg'),
                          SvgPicture.asset('assets/images/visa2.svg'),
                          SvgPicture.asset('assets/images/visa3.svg'),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 12.h,
              ),

              CustomFormField(
                hint: 'رقم البطاقة',
                //  label: StringsManager.fullName,
                controller: cardNumber,
                filled: true,
                keyboard: TextInputType.number,
                action: TextInputAction.next,
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    if (newValue.text.length > 16) {
                      return oldValue;
                    }
                    return newValue;
                  }),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value){
                  if(value.isEmpty){
                    RegisterCubit.get(context).cardNumber = null ;
                  }else {
                    RegisterCubit.get(context).cardNumber = value ;
                  }
                },
                validator: (value){
                  return CustomValidation.nameValidation(value,errorTextName);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomFormField(
                hint: 'تاريخ انتهاء الصلاحية',
                //  label: StringsManager.fullName,
                controller: date,
                filled: true,
                keyboard: TextInputType.datetime,
                action: TextInputAction.next,
                validator: (value){
                  return CustomValidation.nameValidation(value,errorTextName);
                },
                onChanged: (value){
                  if(value.isEmpty){
                    RegisterCubit.get(context).exDate = null ;
                  }else {
                    RegisterCubit.get(context).exDate = value ;
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),

              CustomFormField(
                hint: 'رقم الحماية',
                //  label: StringsManager.fullName,
                controller: pin,
                filled: true,
                keyboard: TextInputType.number,
                action: TextInputAction.next,
                validator: (value){
                  return CustomValidation.nameValidation(value,errorTextName);
                },
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    if (newValue.text.length > 3) {
                      return oldValue;
                    }
                    return newValue;
                  }),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value){
                  if(value.isEmpty){
                    RegisterCubit.get(context).cvc = null ;
                  }else {
                    RegisterCubit.get(context).cvc = value ;
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomFormField(
                hint: 'الاسم على البطاقة',
                //  label: StringsManager.fullName,
                controller: name,
                filled: true,
                keyboard: TextInputType.name,
                action: TextInputAction.done,
                validator: (value){
                  return CustomValidation.nameValidation(value,errorTextName);
                },
                onChanged: (value){
                  if(value.isEmpty){
                    RegisterCubit.get(context).cardName = null ;
                  }else {
                    RegisterCubit.get(context).cardName = value ;
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),

              Row(
                children: [
                  Checkbox(activeColor: ColorsManager.greenColor,value: RegisterCubit.get(context).checkBox, onChanged: (v){
                    setState(() {
                      RegisterCubit.get(context).checkBox = v! ;
                    });
                  }),
                  Text('اوافق على '),
                  Text('الشروط والاحكام',style: TextStyle(color: ColorsManager.greenColor),)
                ],
              )

            ],
          ),
        ) ;
      },
    );
  }
}
