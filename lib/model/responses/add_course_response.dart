class AddCourseSuccessResponse{
  final int? form;
  final int? id;
  final List<dynamic>? materials;



  AddCourseSuccessResponse({
    required this.materials,
    required this.id,
    required this.form,
});


  factory AddCourseSuccessResponse.fromJson(
     {required Map<String,dynamic>json}){
    return AddCourseSuccessResponse(
        id: json['id'],
        form: json['form'],
        materials: json['materials'],
    );
  }

}
