

import 'package:intl_phone_field/phone_number.dart';
import 'package:string_validator/string_validator.dart';
import 'package:test_project/shared/resources/printFunc.dart';
import 'package:test_project/shared/resources/string_manager.dart';

class CustomValidation  {
  static   String password ='';
  static String? passwordValidation(String? value,{String error = ''}){

    String? validationError;
    if (value?.isEmpty ?? false) {
      validationError =
          StringsManager.required;
    } else if ((value?.length ?? 0) < 8) {
      validationError =
          StringsManager.passwordShort;
    } else if (!RegExp(r'[A-Z]')
        .hasMatch(value ?? "")) {
      validationError =
          StringsManager.minUpperCase;
    } else if (!RegExp(r'[a-z]')
        .hasMatch(value ?? "")) {
      validationError =
          StringsManager.minLowerCase;
    } else if (!RegExp(r'\d')
        .hasMatch(value ?? "")) {
      validationError =
          StringsManager.minNumber;
    }else if(error.isNotEmpty){
      validationError = error;
    }
    validationError==null?(password=value??''):{};
    return validationError;
  }
  static String? confirmPasswordValidation(String? confirm){

    String? validationError;
    if (confirm?.isEmpty ?? false) {
      validationError =
          StringsManager.required;
    } else if (confirm.toString() != password.toString()) {
      validationError =
          StringsManager.confirmPassword;
    }  else if ((confirm?.length ?? 0) < 8) {
      validationError =
          StringsManager.passwordShort;
    } else if (!RegExp(r'[A-Z]')
        .hasMatch(confirm ?? "")) {
      validationError =
          StringsManager.minUpperCase;
    } else if (!RegExp(r'[a-z]')
        .hasMatch(confirm ?? "")) {
      validationError =
          StringsManager.minLowerCase;
    } else if (!RegExp(r'\d')
        .hasMatch(confirm ?? "")) {
      validationError =
          StringsManager.minNumber;
    }


    return validationError;
  }
  static String? nameValidation(String? value, String error){

    String? validationError;
    if (value?.isEmpty ?? false) {
      validationError =
          StringsManager.required;
    } else if(isEmail(value??'')){
      StringsManager.name;
    }else if(error.isNotEmpty){
      validationError = error;
    }
    return validationError;
  }
  static String? phoneValidation(String? value, String error){

    String? validationError;
    if (value?.isEmpty ?? false) {
      validationError =
          StringsManager.required;
    }
    else if(value!.isNotEmpty && value.length<10){
      validationError =
          StringsManager.errorNumber;
    }
    else if(isEmail(value)){
      StringsManager.phone;
    }else if(error.isNotEmpty){
      validationError = error;
    }
    return validationError;
  }
  static String? emailValidation(String? value,String error){
    String? validationError;
    if (value?.isEmpty ?? false) {
      validationError =
          StringsManager.required;
    } else if((isEmail(value??'')==false)){

      validationError =  StringsManager.emailValid;
    }else if(error.isNotEmpty){
      validationError = error;
    }

    return validationError;
  }
  static String? phoneValidator(PhoneNumber? value) {
    printFunc(printName: 'kdsfkjk');
    if (value == null) {
      return StringsManager.addPhone;
    }

    String formattedNumber =
    value.completeNumber.replaceAll(RegExp(r'[^\d+]'), '');

    String pattern = r'^\+[1-9]\d{1,14}$';
    RegExp regExp = RegExp(pattern);

    if (formattedNumber.isEmpty) {
      return StringsManager.addPhone;
    } else if (!regExp.hasMatch(formattedNumber)) {
      return StringsManager.addPhoneValid;
    }

    return null;
  }

  static String? invitationCodeValidation(String? value){

    return null;
  }
}