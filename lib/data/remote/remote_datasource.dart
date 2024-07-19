import '../../model/requests/add_info_puprposal_request.dart';
import '../../model/requests/specifiction_request.dart';
import '../../model/requests/add_course_request.dart';
import '../../model/requests/register_request.dart';
import '../../model/requests/add_period_session.dart';
import '../../model/responses/add_info_response.dart';
import '../../model/responses/material_model_response.dart';
import '../../model/responses/specifiction_response.dart';
import '../../model/responses/add_course_response.dart';
import '../../model/responses/register_response.dart';

abstract class RemoteDataSource {

  Future<UserRegisterSuccessResponse> register(
      {required UserRegisterRequest registerRequest});


  Future<SpecifctionResponse> specifiatio({required SpecifitionRequest specifionRequest});



  Future<AddCourseSuccessResponse> addCourse(
      {required AddCourseRequest addCourseRequest});

  Future<AddInfoPurposalSuccessResponse> addInfoPurposal(
      {required AddInfoPurposalRequest addInfoPurposalRequest});

  Future<AddInfoPurposalSuccessResponse> addPeriod(
      {required AddPeriodResponse addPeriodResponse});

  Future<AddInfoPurposalSuccessResponse> addSession(
      {required AddSessionResponse addPeriodResponse});

  Future<AddInfoPurposalSuccessResponse> pay(
      {required PaySessionResponse paySessionResponse});

  Future<List<MaterialModel>> getHomeMaterial();
  Future<List<MaterialModel>> getHomePruPose();

  Future<List<MaterialModel>> getDays();
  Future<List<SubsriptionModel>> getSup();












}
