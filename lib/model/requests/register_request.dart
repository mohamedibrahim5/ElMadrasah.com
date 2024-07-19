
class UserRegisterRequest {
  final String? firstName;
  final String? lastName;
   int? age;
   String? gender;
   String? nationality ;
  final String? phone ;
  final String? email ;
   String? difficulties ;
   String? description ;
  final int? id ;
  UserRegisterRequest({
     this.firstName,
    this.lastName,
     this.age,
     this.gender,
     this.nationality,
     this.phone,
     this.email,
     this.difficulties,
     this.description,this.id
  });

  Map<String, dynamic> toJson() {
    return {
        "first_name":firstName,
        "family_name":lastName,
      "age":age,
      "gender" :gender,
      "nationality":nationality,
      "whatsapp":phone,
      "email":email,
      "difficulties":difficulties,
      "description":description
    };
  }

  factory UserRegisterRequest.fromJson(
      {required Map<dynamic, dynamic> json}) {
    return UserRegisterRequest(

      firstName: json['first_name'],
      age: json['age'],
      email: json['email'],
      lastName: json['family_name'],
      gender: json['gender'],
      phone:json['whatsapp'],
      nationality: json['nationality'],
      difficulties: json['difficulties'],
      description:json['description'],
      id: json['id']
    );
  }
}
