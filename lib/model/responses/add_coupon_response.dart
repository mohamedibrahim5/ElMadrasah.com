class AddCouponResponse{
  final num? discount;
  final String? coupon ;

  AddCouponResponse({this.discount,this.coupon});

  factory AddCouponResponse.fromJson({
    required Map<String,dynamic>json}){
    return AddCouponResponse(
      discount : json['discount'],
    );
  }

  factory AddCouponResponse.fromNotVerified({required Map<String, dynamic> json}) {
    return AddCouponResponse(
        coupon: json['coupon']
    );
  }

}