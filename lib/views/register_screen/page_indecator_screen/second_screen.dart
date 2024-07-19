import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/info_widget.dart';
import '../widget/linear_indecator.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> chooseFirst = [
    'رياض الاطفال',
    'التعليم الابتدائي',
    'التعليم المتوسط',
    'التعليم الثانوي'
  ];
  List<String> chooseThird =[
    'المنهج البريطاني',
  'المنهج الامريكي',
    'المنهج الوزاري',
  'أخرى',
  ];
  List<String> chooseKg =[
    'رياض اطفال 1',
    'رياض اطفال 2'
  ];
  List<String> first =[
    'الصف الاول',
    'الصف الثاني',
  'الصف الثالث',
    'الصف الرابع'
  ];
  List<String> second =[
    'الصف الخامس',
    'الصف السادس',
    'الصف السابع',
  ];
  List<String> third =[
    'الصف الثامن',
    'الصف التاسع',
    'الصف العاشر',
  ];

  int? _value1 = 0;
  int? _value2 = 0 ;
  int? _value3 = 0 ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          linearIndiator(percent: 2 / 8),
          SizedBox(
            height: 20.h,
          ),
          AnimationWidget(
            yOffset: -20,
            widget: InFoWidget(
                color: ColorsManager.orange,
                title:
                    'اختر المرحلة الدراسية التي تناسبك وستضمن لك افضل الخيارات التعليمية المتاحة '),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text('حدد المرحلة الدراسية *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.greyText
          ),),
          SizedBox(
            height: 12.h,
          ),
          Wrap(
            // list of length 3
            children: List.generate(
              4,
              (int index) {
                // choice chip allow us to
                // set its properties.
                return Padding(
                  padding:  REdgeInsets.all(4),
                  child: ChoiceChip(
                    shape: StadiumBorder(side: BorderSide(
                      color: _value1 == index ? ColorsManager.greenColor:Colors.transparent
                    )),
                    padding: REdgeInsets.all(8),
                    backgroundColor: ColorsManager.whiteColor,
                    label: Text('${chooseFirst[index]}'),
                    // color of selected chip
                    selectedColor: ColorsManager.whiteColor,
                    // selected chip value
                    selected: _value1 == index,
                    // onselected method
                    onSelected: (bool selected) {
                      setState(() {
                        if(selected){
                          print('hjfhj${selected}${_value1}');
                          _value1 = selected ? index : null;
                          RegisterCubit.get(context).stage  = _value1 == 0 ?  'kg' :_value1 == 1 ? 'primery' :_value1 == 2 ?'secondary':'high_school';
                          RegisterCubit.get(context).classRoom  = _value1 == 0 ?  'kg_1' :_value1 == 1 ? 'first' :_value1 == 2 ?'fifth':'eight';
                          _value2 = 0 ;
                        }

                      });
                    },
                  ),
                );
              },
            ).toList(),
          ),
      
          Text('حدد صفك الدراسي *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.greyText
          ),),
          SizedBox(
            height: 12.h,
          ),
          Wrap(
            // list of length 3
            children: List.generate(
              _value1 == 0 ? 2:_value1 == 1 ? 4 :3,
                  (int index) {
                // choice chip allow us to
                // set its properties.
                return Padding(
                  padding:  REdgeInsets.all(4),
                  child: ChoiceChip(
                    shape: StadiumBorder(side: BorderSide(
                        color: _value2 == index ? ColorsManager.greenColor:Colors.transparent
                    )),
                    padding: REdgeInsets.all(8),
                    backgroundColor: ColorsManager.whiteColor,
                    label: Text(_value1 == 0 ?'${chooseKg[index]}' :_value1 == 1 ?'${first[index]}':_value1 == 2 ?'${second[index]}' :'${third[index]}'),
                    // color of selected chip
                    selectedColor: ColorsManager.whiteColor,
                    // selected chip value
                    selected: _value2 == index,
                    // onselected method
                    onSelected: (bool selected) {
                      if(selected){
                        setState(() {
                          _value2 = selected ? index : null;
                          RegisterCubit.get(context).classRoom = _value1 == 0 ? _value2 == 0 ? 'kg_1' :'kg_2': _value1 == 1 ?  _value2 == 0 ? 'first' : _value2 == 1 ? 'second' :_value2 == 2 ? 'third' : 'fourth' :_value1 == 2 ? _value2 == 0 ? 'fifth' : _value2 == 1 ? 'six' : 'seven' : _value2 == 0 ? 'eight' : _value2 == 1 ? 'nine' : 'ten' ;
                        });
                      }

                    },
                  ),
                );
              },
            ).toList(),
          ),
      
      
          SizedBox(
            height: 12.h,
          ),
          Text('حدد المنهج الدراسي *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.greyText
          ),),
          SizedBox(
            height: 12.h,
          ),
          Wrap(
            // list of length 3
            children: List.generate(
              4,
                  (int index) {
                // choice chip allow us to
                // set its properties.
                return Padding(
                  padding:  REdgeInsets.all(4),
                  child: ChoiceChip(
                    shape: StadiumBorder(side: BorderSide(
                        color: _value3 == index ? ColorsManager.greenColor:Colors.transparent
                    )),
                    padding: REdgeInsets.all(8),
                    backgroundColor: ColorsManager.whiteColor,
                    label: Text('${chooseThird[index]}'),
                    // color of selected chip
                    selectedColor: ColorsManager.whiteColor,
                    // selected chip value
                    selected: _value3 == index,
                    // onselected method
                    onSelected: (bool selected) {
                      if(selected){
                        setState(() {
                          _value3 = selected ? index : null;
                          RegisterCubit.get(context).courseStudy  = _value3 == 0 ?  'ig' :_value3 == 1 ? 'sat' :_value3 == 2 ?'normal':'other';

                        });
                      }

                    },
                  ),
                );
              },
            ).toList(),
          ),
      
      
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('adjklflsd');
  }
}
