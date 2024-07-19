import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/model/requests/add_info_puprposal_request.dart';
import 'package:test_project/model/requests/specifiction_request.dart';
import 'package:test_project/model/requests/add_period_session.dart';
import 'package:test_project/model/responses/specifiction_response.dart';
import 'package:test_project/shared/resources/prefs_helper.dart';

import '../../../model/requests/add_course_request.dart';
import '../../../model/requests/register_request.dart';
import '../../../model/responses/add_info_response.dart';
import '../../../model/responses/error_response.dart';
import '../../../model/responses/material_model_response.dart';
import '../../../model/responses/add_course_response.dart';
import '../../../model/responses/register_response.dart';
import '../../../repository/repository.dart';
import '../../../shared/resources/service_locator.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Repository repository;
  RegisterCubit({required this.repository}) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
   String stage = 'kg' ;
   String classRoom = 'kg_1' ;
   String courseStudy = 'ig';
  List<int> selectedId =[];
  List<int> selectedAddtionalInfo =[];
  List<int> selectedDays =[];
  UserRegisterRequest? userRegisterRequest ;
  String studentCount = '1';
  String chooseShift =  'day' ;
  String chooseTime = '12:00';
  String session = 'one' ;
  String timeMany = '00:30' ;
  int? subscription ;
  String? price ;

  String? cardNumber ;
  String? cvc ;
  String? exDate ;
  String? cardName ;
  bool checkBox = false ;


  // UserRegisterRequest userRegisterRequest = UserRegisterRequest() ;
  // String country = 'United Arab Emirates' ;

  register() async {
    emit(RegisterLoadingState());

    final registerModel = await repository.registerClient(clientRegisterRequest: userRegisterRequest!);

    registerModel.fold((success) async {
      emit(RegisterSuccessState(userRegisterSuccessResponse: success));
    }, (failure) => emit(RegisterErrorState(userRegisterErrorResponse: failure)));
  }

  spacifition({required SpecifitionRequest specifitionRequest}) async {
    emit(RegisterSpecificState());
    final registerModel = await repository.login(specifitionRequest: specifitionRequest);

    registerModel.fold((success) async {
      emit(RegisterSuccessStateSpeific(userRegisterSuccessResponse: success));
    }, (failure) => emit(RegisterErrorStateSpe(userRegisterErrorResponse: failure)));
  }

  getMateria() async {
    emit(RegisterMaterial());
    final registerModel = await repository.getMaterialData();

    registerModel.fold((success) async {
      emit(RegisterSuccessStateMaterial(materialModel: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  getPurpose() async {
    emit(RegisterMaterial());
    final registerModel = await repository.getHomePruPose();

    registerModel.fold((success) async {
      emit(RegisterSuccessStatePurposal(materialModel: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  getDays() async {
    emit(RegisterMaterial());
    final registerModel = await repository.getDays();

    registerModel.fold((success) async {
      emit(RegisterSuccessStateDays(materialModel: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  getSup() async {
    emit(RegisterMaterial());
    final registerModel = await repository.getSup();

    registerModel.fold((success) async {
      emit(RegisterSuccessStateSup(materialModel: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }


  addCourse() async {
    emit(RegisterAddCourse());
    final registerModel = await repository.addCourse(addCourseRequest: AddCourseRequest(
      materials: selectedId,
      form: sl<PrefsHelper>().formId()
    ));

    registerModel.fold((success) async {
      emit(RegisterSuccessStateAddCourse(addCourseSuccessResponse: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  addInfoPurposal()async{
    emit(RegisterAddCourse());
    final registerModel = await repository.addInfoPurposal(addInfoPurposalRequest: AddInfoPurposalRequest(
        purposes: selectedAddtionalInfo,
        form: sl<PrefsHelper>().formId(),
      studentCount: studentCount
    ));

    registerModel.fold((success) async {
      emit(RegisterSuccessStateAddInfoPurposal(addCourseSuccessResponse: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  addPeriod()async{
    emit(RegisterAddCourse());
    final registerModel = await repository.addPeriod(addPeriodResponse: AddPeriodResponse(
        day: selectedDays,
        form: sl<PrefsHelper>().formId(),
        time: chooseTime,
      shift: chooseShift
    ));

    registerModel.fold((success) async {
      emit(RegisterSuccessStateAddPeriod(addInfoPurposalSuccessResponse: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  addSession()async{
    emit(RegisterAddCourse());
    final registerModel = await repository.addSession(addSessionResponse: AddSessionResponse(
        form: sl<PrefsHelper>().formId(),
      hour: timeMany,
      session: session,
      subscription: subscription ?? 0
    ));

    registerModel.fold((success) async {
      emit(RegisterSuccessStateSession(addCourseSuccessResponse: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

  pay()async{
    emit(RegisterAddCourse());
    final registerModel = await repository.pay(paySessionResponse: PaySessionResponse(
        form: sl<PrefsHelper>().formId(),
        cvc: int.parse(cvc!),
      cardNumber: cardNumber ?? '',
      card_holder: cardName ?? '',
      exp_date: exDate ?? ''
    ));

    registerModel.fold((success) async {
      emit(RegisterSuccessStatePay(addCourseSuccessResponse: success));
    }, (failure) => emit(RegisterErrorStateMaterial()));
  }

}
