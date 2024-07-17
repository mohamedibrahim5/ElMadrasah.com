class ForgotPassSuccessResponse{
  final String? phone;
  final String? otp ;


  ForgotPassSuccessResponse({this.phone,this.otp});


  factory ForgotPassSuccessResponse.fromJson({
    required Map<String,dynamic>json}){
    return ForgotPassSuccessResponse(
      phone : json['phone'] ,
      otp : json['otp']
    );
  }

}

class ForgotPassErrorResponse{
  final String? phone;
  ForgotPassErrorResponse({required this.phone});


  factory ForgotPassErrorResponse.fromJson(
  {required Map<String,dynamic>json}){
    return ForgotPassErrorResponse(
      phone : json['phone'] == null ? null : List<String>.from(json['phone']).first,
    );

  }

}