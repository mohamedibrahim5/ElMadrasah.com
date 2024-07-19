import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/info_widget.dart';
import '../../../shared/resources/loading_indicator_widget.dart';
import '../cubit/register_cubit.dart';
import '../widget/linear_indecator.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key});

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  List<String> chooseSession = [
    'حصة واحدة' ,'حصتين',
  ];
  List<String> chooseTimeMany = [
    '30 دقيقة' ,'ساعة واحدة','ساعة ونص','ساعتين','ساعتين ونص '
  ];
  int _value1 = 0 ;
  int _value2 = 0 ;
  int _value3 = 50 ;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RegisterCubit,RegisterState>(
      listener: (BuildContext context, state) {
        if(state is RegisterSuccessStateSup){
        }
      },
      builder: (BuildContext context, Object? state) {
        return state is RegisterSuccessStateSup ?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              linearIndiator(
                  percent: 6/8
              ),
              SizedBox(
                height: 20.h,
              ),
              AnimationWidget(
                yOffset: -20,
                widget: InFoWidget(
                    color: ColorsManager.orange,
                    title:
                    'كون الباقة التى تتناسب مع احتياجاتك وستضمن لك افضل استفادة من كل حصة'),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text('كم حصة اسبوعيا  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        label: Text('${chooseSession[index]}'),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: _value1 == index,
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            _value1 = (selected ? index : null)!;
                            RegisterCubit.get(context).session =_value1 == 0 ? 'one' : 'two';
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
              Text('كم عدد ساعات الحصة الواحدة  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                  5,
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
                        label: Text('${chooseTimeMany[index]}'),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: _value2 == index,
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            _value2 = (selected ? index : null)!;
                            RegisterCubit.get(context).timeMany =_value2 == 0 ? '00:30' :_value2 == 1 ? '01:00' :_value2 == 2 ? '01:30' :_value2 == 3 ? '02:00':'02:30';
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
              Text('مدة الاشتراك  *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      padding:  REdgeInsets.all(8),
                      child: ChoiceChip(
                        shape: RoundedRectangleBorder(side: BorderSide(
                            color: _value3 == index ? ColorsManager.greenColor:Colors.transparent
                        ),borderRadius: BorderRadius.circular(16),),
                        padding: REdgeInsets.all(16),
                        backgroundColor: ColorsManager.whiteColor,
                        label: Padding(
                          padding:  REdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsManager.red500,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding:  REdgeInsets.symmetric(
                                    vertical:4
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${state.materialModel[index].discount}%  خصم ',style: TextStyle(
                                      color: ColorsManager.redScreen
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(child: Text('${state.materialModel[index].arabicTerm}')),
                              SizedBox(
                                height: 4.h,
                              ),
                              Center(child: Text('${state.materialModel[index].arabicPeriod}',style: TextStyle(
                                color: ColorsManager.greenColor
                              ),)),
                              SizedBox(
                                height: 4.h,
                              ),
                              AnimationWidget(
                                widget: InFoWidget(
                                    color: ColorsManager.greenColor,
                                    title:
                                    '${state.materialModel[index].price}درهم  '),
                              ),
                            ],
                          ),
                        ),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: _value3 == index,
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            _value3 = (selected ? index : null)!;
                            RegisterCubit.get(context).subscription = state.materialModel[index].id ?? 0;
                            RegisterCubit.get(context).price = state.materialModel[index].price ?? "650" ;
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
    RegisterCubit.get(context).subscription = null ;
    RegisterCubit.get(context).getSup();
  }

}
