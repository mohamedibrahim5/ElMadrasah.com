class ErrorResponse{
  final String message;
ErrorResponse({required this.message});
  factory ErrorResponse.fromJson({
    required Map<String,dynamic>json}){
    return ErrorResponse(
      message : json['message'],
    );
  }



}