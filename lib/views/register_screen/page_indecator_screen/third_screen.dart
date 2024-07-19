import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/shared/resources/loading_indicator_widget.dart';
import 'package:test_project/views/register_screen/cubit/register_cubit.dart';

import '../../../shared/resources/animation_widget.dart';
import '../../../shared/resources/colors_manager.dart';
import '../../../shared/resources/image_card.dart';
import '../../../shared/resources/info_widget.dart';
import '../widget/linear_indecator.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<String> chooseFirst = [
    'رياض الاطفال',
    'التعليم الابتدائي',
    'التعليم المتوسط',
    'التعليم الثانوي'
  ];
  List<bool> isChecked = [];

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RegisterCubit,RegisterState>(
      listener: (BuildContext context, state) {
        if(state is RegisterSuccessStateMaterial){
          isChecked = List<bool>.filled(state.materialModel.length, false);
        }
      },
      builder: (BuildContext context, Object? state) {
        return state is RegisterSuccessStateMaterial ?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              linearIndiator(
                  percent: 3/8
              ),
              SizedBox(
                height: 20.h,
              ),
              AnimationWidget(
                xOffset: -20,
                widget: InFoWidget(
                    color: ColorsManager.greenColor,
                    title:
                    'حدد المواد التي ترغب في تسجيلها وسنوفر لك الدعم اللازم لتحقيق اهداف الاكاديمية'),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text('حدد المواد التي ترغب في دراستها *',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        label: Column(
                          children: [
                            ImageCard(
                              imageUrl: state.materialModel[index].image,
                            ),
                            Text('${state.materialModel[index].arabicData}'),
                          ],
                        ),
                        // color of selected chip
                        selectedColor: ColorsManager.whiteColor,
                        // selected chip value
                        selected: isChecked[index],
                        // onselected method
                        onSelected: (bool selected) {
                          setState(() {
                            isChecked[index] = selected;
                            if(isChecked[index]){
                              RegisterCubit.get(context).selectedId.add(state.materialModel[index].id ?? 0);
                            }else {
                              RegisterCubit.get(context).selectedId.removeWhere((element) => state.materialModel[index].id == element);
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
        ) :
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
    RegisterCubit.get(context).selectedId.clear() ;
    RegisterCubit.get(context).getMateria();
  }
}
