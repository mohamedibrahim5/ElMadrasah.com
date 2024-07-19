class AddInfoPurposalRequest{
  final String studentCount;
  final int form ;
  final List<int> purposes ;

  AddInfoPurposalRequest({required this.studentCount,required this.form,required this.purposes});


  Map<String,dynamic> toJson(){
    return{
      'student_count':studentCount,
      'form':form,
      'purposes':purposes

    };

  }



}