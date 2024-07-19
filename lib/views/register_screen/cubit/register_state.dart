part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterErrorState extends RegisterState{
  final UserRegisterErrorResponse userRegisterErrorResponse;
  RegisterErrorState({required this.userRegisterErrorResponse});
}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState {

  final UserRegisterSuccessResponse userRegisterSuccessResponse;

  RegisterSuccessState({required this.userRegisterSuccessResponse});
}

class RegisterErrorStateSpe extends RegisterState{
  final ErrorResponse userRegisterErrorResponse;
  RegisterErrorStateSpe({required this.userRegisterErrorResponse});
}

class RegisterSpecificState extends RegisterState{}

class RegisterSuccessStateSpeific extends RegisterState {

  final SpecifctionResponse userRegisterSuccessResponse;

  RegisterSuccessStateSpeific({required this.userRegisterSuccessResponse});
}

class RegisterErrorStateMaterial extends RegisterState{}

class RegisterMaterial extends RegisterState {}

class RegisterSuccessStateMaterial extends RegisterState {

   final List<MaterialModel> materialModel;

   RegisterSuccessStateMaterial({required this.materialModel});
}

class RegisterAddCourse extends RegisterState {}

class RegisterSuccessStateAddCourse extends RegisterState {

  final AddCourseSuccessResponse addCourseSuccessResponse;

  RegisterSuccessStateAddCourse({required this.addCourseSuccessResponse});
}

class RegisterSuccessStatePurposal extends RegisterState {

  final List<MaterialModel> materialModel;

  RegisterSuccessStatePurposal({required this.materialModel});
}

class RegisterSuccessStateDays extends RegisterState {

  final List<MaterialModel> materialModel;

  RegisterSuccessStateDays({required this.materialModel});
}

class RegisterSuccessStateSup extends RegisterState {

  final List<SubsriptionModel> materialModel;

  RegisterSuccessStateSup({required this.materialModel});
}

class RegisterSuccessStateAddInfoPurposal extends RegisterState {

  final AddInfoPurposalSuccessResponse addCourseSuccessResponse;

  RegisterSuccessStateAddInfoPurposal({required this.addCourseSuccessResponse});
}

class RegisterSuccessStateAddPeriod extends RegisterState {

  final AddInfoPurposalSuccessResponse addInfoPurposalSuccessResponse;

  RegisterSuccessStateAddPeriod({required this.addInfoPurposalSuccessResponse});
}

class RegisterSuccessStateSession extends RegisterState {

  final AddInfoPurposalSuccessResponse addCourseSuccessResponse;

  RegisterSuccessStateSession({required this.addCourseSuccessResponse});
}

class RegisterSuccessStatePay extends RegisterState {

  final AddInfoPurposalSuccessResponse addCourseSuccessResponse;

  RegisterSuccessStatePay({required this.addCourseSuccessResponse});
}