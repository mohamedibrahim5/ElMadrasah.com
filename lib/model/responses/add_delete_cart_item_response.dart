class AddDeleteCartItemResponse{
  final String? message;
  final num? total;
  final String? sessionKey;
  AddDeleteCartItemResponse({required this.message,this.total,this.sessionKey});

  factory AddDeleteCartItemResponse.fromJson(
      {required Map<String, dynamic> json}){
    return AddDeleteCartItemResponse(
      message: json['message'],
        total: json['total'],
        sessionKey: json['session_key']
    );
  }


}