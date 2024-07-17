// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'colors_manager.dart';

class PhoneField extends StatefulWidget {
  Function onChange;
  TextEditingController? controller;
  String? placeholder;
  String label;
  String? Function(PhoneNumber?)? validator;
  final TextInputAction action;
  final FocusNode? focusNode;
  PhoneField({
    super.key,
    required this.onChange,
    this.controller,
    this.placeholder,
    required this.label,
    this.validator,
    required this.action,
    required this.focusNode
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonMargin: REdgeInsets.only(
        left: 16,
        right: 10
      ),
      pickerDialogStyle: PickerDialogStyle(
        countryNameStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: ColorsManager.black
        ),
      ),
      controller: widget.controller,
      validator: widget.validator,
      initialCountryCode: 'EG',
      textAlignVertical: TextAlignVertical.center,
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        hintText: 'fdassa',
        labelText: "widget.label",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: ColorsManager.greyTextColor),
          borderRadius: BorderRadius.circular( 10.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: ColorsManager.greyTextColor),
          borderRadius: BorderRadius.circular( 10.r),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red,width: 0.5.w,),
          borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
        ),
        contentPadding: REdgeInsets.only(left: 16, right: 16 ,top: 14,bottom: 14),
        filled: true,
        isCollapsed: true,
        fillColor:  ColorsManager.textFormFieldColor,
        focusedErrorBorder: InputBorder.none,
        hintStyle: Theme.of(context).textTheme.displayLarge,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: ColorsManager.greyTextColor),
          borderRadius: BorderRadius.circular( 10.r),
        ),
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 14.sp, color: ColorsManager.errorColor),
      ),
      onChanged: (value) => widget.onChange(value),
      textInputAction: widget.action,
    );
  }
}
