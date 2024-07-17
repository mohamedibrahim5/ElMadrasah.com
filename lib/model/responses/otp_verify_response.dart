class UserOtpVerifySuccessResponse{
  final String? message;
  final int? id;
  final String? fullName;
  final String? phone;
  bool? active;
  bool? verified;
  String? token;
  String? email ;


  UserOtpVerifySuccessResponse({
    required this.phone,
    required this.id,
    required this.fullName,
    required this.active,
    required this.verified,
    required this.token,
    required this.message,
    this.email

});


  factory UserOtpVerifySuccessResponse.fromJson(
     {required Map<String,dynamic>json}){
    return UserOtpVerifySuccessResponse(
        phone: json['phone'],
        id: json['id'],
        fullName: json['full_name'],
        active: json['active'],
        verified: json['verified'],
        token: json['token'],
        message: json['message'],
        email: json['email']
    );
  }

}

class UserOtpVerifyErrorResponse{
  final String message;
  UserOtpVerifyErrorResponse({required this.message});

  factory UserOtpVerifyErrorResponse.fromJson(
  {required Map<String, dynamic> json}){
    return UserOtpVerifyErrorResponse(
      message: json['message'],
    );
  }


}