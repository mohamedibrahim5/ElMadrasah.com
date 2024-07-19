class AddPeriodResponse{
  final String shift;
  final String time;
  final int form;
  final List<int> day ;

  AddPeriodResponse({
    required this.shift,
    required this.time,
    required this.form,required this.day});


  Map<String,dynamic>toJson(){
    return{
      'shift':shift,
      'time':time,
      'form':form,
      'day':day
      // 'new_password2':password
    };
  }



}

class AddSessionResponse{
  final String session;
  final String hour;
  final int form;
  final int subscription ;

  AddSessionResponse({
    required this.session,
    required this.hour,
    required this.form,required this.subscription});


  Map<String,dynamic>toJson(){
    return{
      'session':session,
      'hour':hour,
      'form':form,
      'subscription':subscription
      // 'new_password2':password
    };
  }



}

class PaySessionResponse{
  final String cardNumber;
  final String exp_date;
  final int form;
  final int cvc ;
  final String card_holder ;

  PaySessionResponse({
    required this.cardNumber,
    required this.exp_date,
    required this.form,required this.cvc,required this.card_holder});


  Map<String,dynamic>toJson(){
    return{
      'card_number':cardNumber,
      'exp_date':exp_date,
      'form':form,
      'cvc':cvc,
      'card_holder':card_holder
      // 'new_password2':password
    };
  }



}


class ChangePasswordRequest{
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    });


  Map<String,dynamic>toJson(){
    return{
      'old_password':oldPassword,
      'new_password':newPassword,
    };
  }



}