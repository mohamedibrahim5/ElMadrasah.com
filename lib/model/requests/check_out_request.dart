class CheckOutRequest {
  final String? date;
  final String? time;
  final String? fullName;
  final String? phone;

  CheckOutRequest({required this.date, required this.time,required this.phone,required this.fullName});

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'phone': phone,
      'full_name': fullName,
    };
  }
}