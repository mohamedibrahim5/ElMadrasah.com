import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'assets_manager.dart';
import 'colors_manager.dart';

class DropDownButtonReusable extends StatelessWidget {
  const  DropDownButtonReusable({super.key,required this.items,required this.onChanged,this.selectedValue,required this.hintText,this.search  });
  final List<String> items ;
  final Function(String?) onChanged;
  final String? selectedValue ;
  final String hintText ;
  final TextEditingController? search ;



  @override
  Widget build(BuildContext context) {
    return Container(

      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorsManager.dropDownColor,
          borderRadius: BorderRadius.circular(5.r),

      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconStyleData:  IconStyleData(
            icon: Padding(
              padding:  REdgeInsets.only(
                left: 8
              ),
              child: SvgPicture.asset(AssetsManager.arrowDownIcon),
            ),
          ),
          style:Theme.of(context).textTheme.bodyLarge ,
          menuItemStyleData:  MenuItemStyleData(
            padding: REdgeInsets.symmetric(
              horizontal: 16
            ),
          ),
          buttonStyleData: ButtonStyleData(
            padding: REdgeInsets.all(0),
            decoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                    color: ColorsManager.greyText,
                    width: 1
                )
            ),
          ),

          dropdownStyleData: DropdownStyleData(
            padding: REdgeInsets.all(0),
            decoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                    color: ColorsManager.greyText,
                    width: 1
                )
            ),
          ),
          isExpanded: true,
          hint: Text(
              hintText,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 12.sp
            ),
          ),
          items: items.map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
                item,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 12.sp
              ),
            ),
          )).toList(),
          value: selectedValue,
          onChanged: onChanged,
          dropdownSearchData:search == null ? null : DropdownSearchData(
            searchController: search,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),
                expands: true,
                maxLines: null,
                controller: search,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'بحث *',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);

            },
          ),
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              if(search != null){
                search?.clear();
              }
            }
          },

        ),
      ),
    );
  }
}
