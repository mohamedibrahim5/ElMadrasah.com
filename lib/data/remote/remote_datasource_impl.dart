import 'package:dio/dio.dart';
import 'package:test_project/data/remote/remote_datasource.dart';
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
import '../../model/responses/error_response.dart';
import '../../shared/resources/constant.dart';
import '../../shared/resources/dio_helper.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;
  final DioHelper dioHelper;

  RemoteDataSourceImpl({required this.dio, required this.dioHelper});
  @override
  Future<UserRegisterSuccessResponse> register(
      {required UserRegisterRequest registerRequest}) async {
    dioHelper.removeHeader();
    final response =
    await dio.post(Constants.registerUrl, data: registerRequest.toJson());

    if (response.statusCode == 201) {
      return UserRegisterSuccessResponse.fromJson(json: response.data);
    }else if (response.statusCode == 403) {
      return UserRegisterSuccessResponse.fromNotVerified(json: response.data);
    } else {
      throw UserRegisterErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<SpecifctionResponse> specifiatio(
      {required SpecifitionRequest specifionRequest}) async {
    dioHelper.removeHeader();
    final response =
    await dio.post(Constants.loginUrl, data: specifionRequest.toJson());

    if (response.statusCode == 201) {
      return SpecifctionResponse.fromJson(json: response.data);
    } else if (response.statusCode == 403) {
      return SpecifctionResponse.fromNotVerified(json: response.data);
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }





  @override
  Future<AddCourseSuccessResponse> addCourse(
      {required AddCourseRequest addCourseRequest}) async {
    final response = await dio.post(Constants.verifyOtpClient,
        data: addCourseRequest.toJson());
    if (response.statusCode == 201) {
      return AddCourseSuccessResponse.fromJson(json: response.data);
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddInfoPurposalSuccessResponse> addInfoPurposal(
      {required AddInfoPurposalRequest addInfoPurposalRequest}) async {
    final response = await dio.post(Constants.resendOtp,
        data: addInfoPurposalRequest.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return AddInfoPurposalSuccessResponse.fromJson(json: response.data);
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddInfoPurposalSuccessResponse> addPeriod(
      {required AddPeriodResponse addPeriodResponse}) async {
    final response = await dio.post(Constants.resetPassUrl,
        data: addPeriodResponse.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return AddInfoPurposalSuccessResponse.fromJson(json: response.data);
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddInfoPurposalSuccessResponse> addSession(
      {required AddSessionResponse addPeriodResponse}) async {
    final response = await dio.post(Constants.sessionBaseUrl,
        data: addPeriodResponse.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return AddInfoPurposalSuccessResponse.fromJson(json: response.data);
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddInfoPurposalSuccessResponse> pay(
      {required PaySessionResponse paySessionResponse}) async {
    final response = await dio.post(Constants.payBaseUrl,
        data: paySessionResponse.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return AddInfoPurposalSuccessResponse.fromJson(json: response.data);
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<List<MaterialModel>> getHomeMaterial() async {
    final response =
        await dio.get(Constants.getHomeCategoryDataUrl);
    if (response.statusCode == 200) {
      return List.from(response.data)
          .map((category) => MaterialModel.fromJson(category))
          .toList();
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<List<MaterialModel>> getHomePruPose() async {
    final response =
    await dio.get(Constants.getHomePurpose);
    if (response.statusCode == 200) {
      return List.from(response.data)
          .map((category) => MaterialModel.fromJson(category))
          .toList();
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }


  @override
  Future<List<MaterialModel>> getDays() async {
    final response =
    await dio.get(Constants.getDay);
    if (response.statusCode == 200) {
      return List.from(response.data)
          .map((category) => MaterialModel.fromJson(category))
          .toList();
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<List<SubsriptionModel>> getSup() async {
    final response =
    await dio.get(Constants.getSup);
    if (response.statusCode == 200) {
      return List.from(response.data)
          .map((category) => SubsriptionModel.fromJson(category))
          .toList();
    } else {
      throw ErrorResponse.fromJson(json: response.data);
    }
  }
}