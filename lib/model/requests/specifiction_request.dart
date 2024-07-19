class SpecifitionRequest{
  final int from;
  final String stage;
  final String classRoom ;
  final String courseStudy ;


  SpecifitionRequest({
    required this.from,
    required this.stage,
    required this.classRoom,
    required this.courseStudy
});

  Map<String,dynamic> toJson(){
    return{
      'form':from,
      'stage':[stage],
      'classroom':[classRoom],
      'course_study':[courseStudy]

    };

  }



}