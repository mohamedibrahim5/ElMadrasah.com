import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/repository/repository.dart';

import '../data/remote/remote_datasource.dart';
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
import '../shared/resources/error_handler.dart';
import '../shared/resources/network_info.dart';
import '../shared/resources/printFunc.dart';
import '../shared/resources/string_manager.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<SpecifctionResponse, ErrorResponse>> login(
      {required SpecifitionRequest specifitionRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final login = await remoteDataSource.specifiatio(
            specifionRequest: specifitionRequest);

        return Left(login);
      } on ErrorResponse catch (error) {
        printFunc(printName:
        '-------------- on LoginErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(
            printName: '-------------- login error: $error --------------');
        return Right(
            ErrorResponse(message: ErrorHandler
                .handle(error)
                .failure));
      }
    } else {
      // no internet connection error
      return Right(
          ErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<UserRegisterSuccessResponse,
      UserRegisterErrorResponse>> registerClient(
      {required UserRegisterRequest clientRegisterRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final register = await remoteDataSource.register(
            registerRequest: clientRegisterRequest);
        return Left(register);
      } on UserRegisterErrorResponse catch (error) {
        printFunc(
            printName: '-------------- on UserRegisterErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(
            printName: '-------------- registerClient error: $error --------------');
        return Right(UserRegisterErrorResponse(
            user: ErrorHandler
                .handle(error)
                .failure
        ));
      }
    } else {
      // no internet connection error
      return Right(UserRegisterErrorResponse(
          user: StringsManager.notFoundError));
    }
  }

  @override
  Future<Either<AddCourseSuccessResponse, ErrorResponse>>
  addCourse({required AddCourseRequest addCourseRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final clientOtp = await remoteDataSource.addCourse(
            addCourseRequest: addCourseRequest);
        return left(clientOtp);
      } on ErrorResponse catch (error) {
        printFunc(printName:
        '-------------- on OtpErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(
            printName: '-------------- userOtp error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler
                .handle(error)
                .failure));
      }
    } else {
      return Right(ErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }


  @override
  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  addInfoPurposal({required AddInfoPurposalRequest addInfoPurposalRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final forgotPass = await remoteDataSource.addInfoPurposal(
            addInfoPurposalRequest: addInfoPurposalRequest);
        return left(forgotPass);
      } on ErrorResponse catch (error) {
        debugPrint(
            '-------------- on Forgot Password Response error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint(
            '-------------- forgotPassword error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler
                .handle(error)
                .failure));
      }
    } else {
      return Right(
          ErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  addPeriod({required AddPeriodResponse addPeriodResponse}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final resetPassPassword = await remoteDataSource.addPeriod(
            addPeriodResponse: addPeriodResponse);
        return left(resetPassPassword);
      } on ErrorResponse catch (error) {
        debugPrint(
            '-------------- on ResetPassword error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- ResetPassword error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler
                .handle(error)
                .failure));
      }
    } else {
      return Right(ErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }


  @override
  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  pay({required PaySessionResponse paySessionResponse}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final resetPassPassword = await remoteDataSource.pay(
            paySessionResponse:paySessionResponse );
        return left(resetPassPassword);
      } on ErrorResponse catch (error) {
        debugPrint(
            '-------------- on ResetPassword error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- ResetPassword error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler
                .handle(error)
                .failure));
      }
    } else {
      return Right(ErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<AddInfoPurposalSuccessResponse, ErrorResponse>>
  addSession(
      {required AddSessionResponse addSessionResponse}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final resetPassPassword = await remoteDataSource.addSession(
            addPeriodResponse: addSessionResponse);
        return left(resetPassPassword);
      } on ErrorResponse catch (error) {
        debugPrint(
            '-------------- on ResetPassword error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- ResetPassword error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  

  @override
  Future<Either<List<MaterialModel>, ErrorResponse>> getMaterialData() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getFilterHomeData = await remoteDataSource.getHomeMaterial();
        return left(getFilterHomeData);
      } on ErrorResponse catch (error) {
        debugPrint('-------------- on GetFilterHomeData error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- GetFilterHomeData error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<List<MaterialModel>, ErrorResponse>> getHomePruPose() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getFilterHomeData = await remoteDataSource.getHomePruPose();
        return left(getFilterHomeData);
      } on ErrorResponse catch (error) {
        debugPrint('-------------- on GetFilterHomeData error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- GetFilterHomeData error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<List<MaterialModel>, ErrorResponse>> getDays() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getFilterHomeData = await remoteDataSource.getDays();
        return left(getFilterHomeData);
      } on ErrorResponse catch (error) {
        debugPrint('-------------- on GetFilterHomeData error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- GetFilterHomeData error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<List<SubsriptionModel>, ErrorResponse>> getSup() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getFilterHomeData = await remoteDataSource.getSup();
        return left(getFilterHomeData);
      } on ErrorResponse catch (error) {
        debugPrint('-------------- on GetFilterHomeData error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- GetFilterHomeData error: $error --------------');
        return Right(ErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }
  
}
