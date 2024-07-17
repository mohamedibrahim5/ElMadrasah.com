class ResetPasswordSuccessResponse{
  final String? token;
  final String? phone;
  final String? email;
  final String? fullName;

  ResetPasswordSuccessResponse({this.phone, this.email, this.fullName,required this.token});

  factory ResetPasswordSuccessResponse.fromJson({
    required Map<String,dynamic>json}){
    return ResetPasswordSuccessResponse(
      token : json['token'],
      phone : json['phone'],
      email : json['email'],
      fullName : json['full_name'],
    );
  }

}

class ResetPasswordErrorResponse{
  final String? message;
  ResetPasswordErrorResponse({required this.message});
  factory ResetPasswordErrorResponse.fromJson({
    required Map<String,dynamic>json}){
    return ResetPasswordErrorResponse(
      message : json['non_field_errors'] == null ? null : List<String>.from(json['non_field_errors']).first,
    );
  }
}


class ChangePasswordSuccessResponse{
  final String? oldPassword;
  final String? message ;
  final String? url ;

  ChangePasswordSuccessResponse({this.oldPassword,this.message,this.url});

  factory ChangePasswordSuccessResponse.fromJson({
    required Map<String,dynamic>json}){
    return ChangePasswordSuccessResponse(
      message : json['message'],
      url : json['url'],
    );
  }

  factory ChangePasswordSuccessResponse.fromNotVerified({required Map<String, dynamic> json}) {
    return ChangePasswordSuccessResponse(
        oldPassword: json['old_password'],
      message : json['message'],
    );
  }

}

class ChangePasswordErrorResponse{
  final String? message;
  ChangePasswordErrorResponse({required this.message});
  factory ChangePasswordErrorResponse.fromJson({
    required Map<String,dynamic>json}){
    return ChangePasswordErrorResponse(
      message : json['message'] ,
    );
  }
}