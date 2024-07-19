import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/info_widget.dart';
import '../../../shared/resources/loading_indicator_widget.dart';
import '../widget/linear_indecator.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  List<String> chooseShift = [
    'الفترة الصباحية' ,'الفترة المسائية',
  ];
  List<String> chooseTime = [
    '12:00',
    '15:00' ,
  ];
  List<bool> isChecked = [];
  int _value1 = 0 ;
  int _value2 = 0 ;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RegisterCubit,RegisterState>(
      listener: (BuildContext context, state) {
        if(state is RegisterSuccessStateDays){
          isChecked = List<bool>.filled(state.materialModel.length, false);
        }
      },
      builder: (BuildContext context, Object? state) {
        return state is RegisterSuccessStateDays ?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              linearIndiator(
                  percent: 5/8
              ),
              SizedBox(
                height: 20.h,
              ),
              AnimationWidget(
                xOffset: -20,
                widget: InFoWidget(
                    color: ColorsManager.greenColor,
                    title:
                    'حدد الفترة الزمنية المناسبة لك وستنظم الحصص وفقا لجدولك الزمني بكل ذقة'),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text('الايام المناسبة لك  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                  state.materialModel.length,
                      (int index) {
                    // choice chip allow us to
                    // set its properties.
                    return Padding(
                      padding:  REdgeInsets.all(4),
                      child: ChoiceChip(
                        shape: StadiumBorder(side: BorderSide(
                            color: isChecked[index] ? ColorsManager.greenColor:Colors.transparent
                        )),
                        padding: REdgeInsets.all(8),
                        backgroundColor: ColorsManager.whiteColor,
                        label: Text('${state.materialModel[index].arabicData}'),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: isChecked[index],
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            isChecked[index] = selected;
                            if(isChecked[index]){
                              RegisterCubit.get(context).selectedDays.add(state.materialModel[index].id ?? 0);
                            }else {
                              RegisterCubit.get(context).selectedDays.removeWhere((element) => state.materialModel[index].id == element);
                            }
                          });
                        },
                      ),
                    );
                  },
                ).toList(),
              ),

              SizedBox(
                height: 12.h,
              ),
              Text('ما الفترة الزمنية المناسبة لك  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                  2,
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
                        label: Text('${chooseShift[index]}'),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: _value1 == index,
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            _value1 = (selected ? index : null)!;
                            RegisterCubit.get(context).chooseShift =_value1 == 0 ? 'day' : 'night';
                          });
                        },
                      ),
                    );
                  },
                ).toList(),
              ),

              SizedBox(
                height: 12.h,
              ),
              Text('اختر التوقيت المناسسب لك  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                  2,
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
                        label: Text('${chooseTime[index]}'),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: _value2 == index,
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            _value2 = (selected ? index : null)!;
                            RegisterCubit.get(context).chooseTime = chooseTime[index];
                          });
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ):
        Center(
          child: LoadingIndicatorWidget(
            isCircular: true,
          ),
        );
      },

    );
  }

  @override
  void initState() {
    super.initState();
    RegisterCubit.get(context).selectedDays.clear() ;
    RegisterCubit.get(context).getDays();
  }

}
