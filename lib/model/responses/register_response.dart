class UserRegisterSuccessResponse {
  final int? id ;
  final String? firstName;
  final String? lastName;
  final int? age;
  final String? gender;
  final String? nationality ;
  final String? phone ;
  final String? email ;
  final String? difficulties ;
  final String? description ;
  UserRegisterSuccessResponse({
    this.phone,
    this.email,
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.difficulties,
    this.nationality,
    this.description,
  });

  factory UserRegisterSuccessResponse.fromJson(
      {required Map<dynamic, dynamic> json}) {
    return UserRegisterSuccessResponse(

      id: json['id'],
      firstName: json['first_name'],
      age: json['age'],
      email: json['email'],
      lastName: json['family_name'],
      gender: json['gender'],
      phone:json['whatsapp'],
      nationality: json['nationality'],
      difficulties: json['difficulties'],
      description:json['description'],
    );
  }

  factory UserRegisterSuccessResponse.fromNotVerified({required Map<dynamic, dynamic> json}) {
    return UserRegisterSuccessResponse(

      phone: json['phone'],
      email: json['email'],
    );
  }
}



class UserRegisterErrorResponse {
  final String? user;
  final String? email;
  final String? phone;
  final bool? isVerified;
  final String? message;
  UserRegisterErrorResponse({
    this.user,
    this.email,
    this.phone,
    this.isVerified,
    this.message
  });

  factory UserRegisterErrorResponse.fromJson(
      {required Map<dynamic, dynamic> json}) {
    return UserRegisterErrorResponse(
      isVerified: json['is_verified'],
      phone: json['phone'],
      email: json['email'],
      user: json['user'],
      message: json['message'],
   //   user: List<String>.from(json['user']),
    );
  }


}