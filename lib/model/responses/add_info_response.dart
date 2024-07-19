class AddInfoPurposalSuccessResponse{
  final int? form;
  final int? id;
  final List<dynamic>? purposes;
  final String? studentCount ;


  AddInfoPurposalSuccessResponse({ this.purposes,
     this.id,
     this.form,this.studentCount});


  factory AddInfoPurposalSuccessResponse.fromJson({
    required Map<String,dynamic>json}){
    return AddInfoPurposalSuccessResponse(
      id: json['id'],
      form: json['form'],
      purposes: json['purposes'],
      studentCount: json['student_count']
    );
  }

}

