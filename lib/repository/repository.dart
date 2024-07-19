import 'package:dartz/dartz.dart';

import '../model/requests/add_info_puprposal_request.dart';
import '../model/requests/specifiction_request.dart';
import '../model/requests/add_course_request.dart';
import '../model/requests/register_request.dart';
import '../model/requests/add_period_session.dart';
import '../model/responses/add_info_response.dart';
import '../model/responses/material_model_response.dart';
import '../model/responses/specifiction_response.dart';
import '../model/responses/add_course_response.dart';
import '../model/responses/register_response.dart';
import '../model/responses/error_response.dart';


abstract class Repository {
  Future<Either<UserRegisterSuccessResponse, UserRegisterErrorResponse>>
  registerClient({required UserRegisterRequest clientRegisterRequest});

  Future<Either<SpecifctionResponse, ErrorResponse>> login(
      {required SpecifitionRequest specifitionRequest});


  Future<Either<AddCourseSuccessResponse, ErrorResponse>>
  addCourse({required AddCourseRequest addCourseRequest});

  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  addInfoPurposal({required AddInfoPurposalRequest addInfoPurposalRequest});

  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  addPeriod({required AddPeriodResponse addPeriodResponse});

  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  pay({required PaySessionResponse paySessionResponse});

  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  addSession({required AddSessionResponse addSessionResponse});
  Future<Either<List<MaterialModel>, ErrorResponse>> getMaterialData();
  Future<Either<List<MaterialModel>, ErrorResponse>> getHomePruPose();
  Future<Either<List<MaterialModel>, ErrorResponse>> getDays();
  Future<Either<List<SubsriptionModel>, ErrorResponse>> getSup();
}
