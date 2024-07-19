
import 'package:intl_phone_field/phone_number.dart';
import 'package:string_validator/string_validator.dart';
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
          "كلمة المرور قصيرة";
    } else if (!RegExp(r'[A-Z]')
        .hasMatch(value ?? "") &&
        !RegExp(r'[a-z]')
            .hasMatch(value ?? "")
    ) {
      validationError =
          "يجب ان تحتوي علي حرف علي الاقل";
    }  else if (!RegExp(r'\d')
        .hasMatch(value ?? "")) {
      validationError =
          "يجب ان تحتوي علي رقم علي الاقل";
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
          "يجب ان تكون كلمة السر متطابقة";
    }  else if (confirm?.isEmpty ?? false) {
      validationError =
          StringsManager.required;
    } else if ((confirm?.length ?? 0) < 8) {
      validationError =
      "كلمة المرور قصيرة";
    } else if (!RegExp(r'[A-Z]')
        .hasMatch(confirm ?? "") &&
        !RegExp(r'[a-z]')
            .hasMatch(confirm ?? "")
    ) {
      validationError =
      "يجب ان تحتوي علي حرف علي الاقل";
    }  else if (!RegExp(r'\d')
        .hasMatch(confirm ?? "")) {
      validationError =
      "يجب ان تحتوي علي رقم علي الاقل";
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
    else if(isEmail(value??'')){
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