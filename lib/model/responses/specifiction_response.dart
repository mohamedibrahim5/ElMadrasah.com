class SpecifctionResponse {
  final int? id;
  final int? from;
  final List<dynamic>? stage;
  final List<dynamic>? classRoom;
  final List<dynamic>? courseStudy;

  SpecifctionResponse(
      {this.id,
      this.stage,
      this.from,
        this.classRoom,
        this.courseStudy,
      });

  factory SpecifctionResponse.fromJson({required Map<String, dynamic> json}) {
    return SpecifctionResponse(
      id: json['id'],
      stage: json['stage'],
      from: json['from'],
        classRoom: json['classroom'],
        courseStudy: json['course_study'],

    );
  }
  factory SpecifctionResponse.fromNotVerified({required Map<String, dynamic> json}) {
    return SpecifctionResponse(
      from: json['message']
    );
  }
}
