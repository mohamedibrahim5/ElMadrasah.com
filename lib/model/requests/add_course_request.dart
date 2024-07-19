class AddCourseRequest{
  final int? form;
  final List<int>? materials;


  AddCourseRequest({
    this.form,
     this.materials,
});




  Map<String,dynamic>toJson(){
    return{
        'form':form,
      'materials':materials,
    };
  }






}