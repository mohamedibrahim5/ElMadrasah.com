import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'assets_manager.dart';
import 'colors_manager.dart';

class DropDownButtonReusable extends StatelessWidget {
  const  DropDownButtonReusable({super.key,required this.items,required this.onChanged,this.selectedValue,required this.hintText });
  final List<String> items ;
  final Function(String?) onChanged;
  final String? selectedValue ;
  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorsManager.dropDownColor,
          borderRadius: BorderRadius.circular(12.r),

      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconStyleData:  IconStyleData(
            icon: SvgPicture.asset(AssetsManager.arrowDownIcon),
          ),
          style:Theme.of(context).textTheme.bodyLarge ,
          menuItemStyleData:  MenuItemStyleData(
            padding: REdgeInsets.symmetric(
              horizontal: 16
            ),
          ),
          buttonStyleData: ButtonStyleData(
            padding: REdgeInsets.symmetric(
              horizontal: 16
            ),
          ),

          dropdownStyleData: DropdownStyleData(
            padding: REdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: ColorsManager.dropDownColor2,
            ),
          ),
          isExpanded: true,
          hint: Text(
              hintText,
              style: Theme.of(context).textTheme.bodyLarge
          ),
          items: items.map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
                item,
                style: Theme.of(context).textTheme.bodyLarge
            ),
          )).toList(),
          value: selectedValue,
          onChanged: onChanged,

        ),
      ),
    );
  }
}
