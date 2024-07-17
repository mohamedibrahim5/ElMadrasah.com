class GetProfileResponse {
  GetProfileResponse({
     this.phone,
    this.email,
    this.fullName,
    this.id
  });

   String? phone;
   String? email;
   String? fullName ;
   int? id ;

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
        phone: json['phone'],
        email: json['email'],
        id: json['id'],
          fullName: json['full_name']
      );
}