import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/info_widget.dart';
import '../../../shared/resources/loading_indicator_widget.dart';
import '../widget/linear_indecator.dart';

class ForthScreen extends StatefulWidget {
  const ForthScreen({super.key});

  @override
  State<ForthScreen> createState() => _ForthScreenState();
}

class _ForthScreenState extends State<ForthScreen> {
  List<String> chooseNumber = [
    'طالب واحد' ,'طالبين','ثلاث طلاب','أكثر من ذلك'
  ];
  List<bool> isChecked = [];
  int _value1 = 0 ;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RegisterCubit,RegisterState>(
      listener: (BuildContext context, state) {
        if(state is RegisterSuccessStatePurposal){
          isChecked = List<bool>.filled(state.materialModel.length, false);
        }
      },
      builder: (BuildContext context, Object? state) {
        return state is RegisterSuccessStatePurposal ?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              linearIndiator(
                  percent: 4/8
              ),
              SizedBox(
                height: 20.h,
              ),
              AnimationWidget(
                yOffset: -20,
                widget: InFoWidget(
                    color: ColorsManager.orange,
                    title:
                    'املا المعلومات الاضافية لتمكيننا من توفير تجربة دراسية مخصصة لاحتياجاتك الفردية'),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text('ما عدد الطلاب المشتركين  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        label: Text('${chooseNumber[index]}'),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: _value1 == index,
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            _value1 = (selected ? index : null)!;
                            RegisterCubit.get(context).studentCount =_value1 == 0 ? '1':_value1 == 1 ? '1' :_value1 == 2 ? '3' : '>3';
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
              Text('حدد اهدافك الدراسية  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                              RegisterCubit.get(context).selectedAddtionalInfo.add(state.materialModel[index].id ?? 0);
                            }else {
                              RegisterCubit.get(context).selectedAddtionalInfo.removeWhere((element) => state.materialModel[index].id == element);
                            }
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
    RegisterCubit.get(context).selectedAddtionalInfo.clear() ;
    RegisterCubit.get(context).getPurpose();
  }
}
