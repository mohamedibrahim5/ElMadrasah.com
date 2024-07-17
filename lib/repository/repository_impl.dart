import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/repository/repository.dart';

import '../data/remote/remote_datasource.dart';
import '../model/requests/add_cart_item_request.dart';
import '../model/requests/check_out_request.dart';
import '../model/requests/forgot_pass_request.dart';
import '../model/requests/login_request.dart';
import '../model/requests/otp_verfiy_request.dart';
import '../model/requests/register_request.dart';
import '../model/requests/resend_otp_request.dart';
import '../model/requests/reset_pass_request.dart';
import '../model/responses/add_coupon_response.dart';
import '../model/responses/add_delete_cart_item_response.dart';
import '../model/responses/forgot_pass_response.dart';
import '../model/responses/get_cart_model.dart';
import '../model/responses/get_home_response.dart';
import '../model/responses/get_order_response.dart';
import '../model/responses/get_profile_response.dart';
import '../model/responses/login_response.dart';
import '../model/responses/otp_verify_response.dart';
import '../model/responses/register_response.dart';
import '../model/responses/resend_otp_response.dart';
import '../model/responses/reset_pass_response.dart';
import '../shared/resources/error_handler.dart';
import '../shared/resources/network_info.dart';
import '../shared/resources/printFunc.dart';
import '../shared/resources/string_manager.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<LoginSuccessResponse, LoginErrorResponse>> login({required LoginRequest loginRequest}) async {

    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final login = await remoteDataSource.login(loginRequest: loginRequest);

        return Left(login);
      } on LoginErrorResponse catch (error) {
        printFunc(printName:
            '-------------- on LoginErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(printName:'-------------- login error: $error --------------');
        return Right(
            LoginErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    } else {
      // no internet connection error
      return Right(
          LoginErrorResponse(message: StringsManager.notFoundError.tr()));
    }

  }

  @override
  Future<Either<UserRegisterSuccessResponse, UserRegisterErrorResponse>> registerClient({required UserRegisterRequest clientRegisterRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final register = await remoteDataSource.register(
            registerRequest: clientRegisterRequest);
        return Left(register);
      } on UserRegisterErrorResponse catch (error) {
        printFunc(printName: '-------------- on UserRegisterErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(printName: '-------------- registerClient error: $error --------------');
        return Right(UserRegisterErrorResponse(
            user: ErrorHandler.handle(error).failure
        ));
      }
    } else {
      // no internet connection error
      return Right(UserRegisterErrorResponse(
          user: StringsManager.notFoundError));
    }

  }

  @override
  Future<Either<LoginSuccessResponse, LoginErrorResponse>> getUserProfile() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final login = await remoteDataSource.getUserProfile();

        return Left(login);
      } on LoginErrorResponse catch (error) {
        printFunc(printName:
        '-------------- on LoginErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(printName:'-------------- getProfile error: $error --------------');
        return Right(
            LoginErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    } else {
      // no internet connection error
      return Right(
          LoginErrorResponse(message: StringsManager.notFoundError.tr()));
          }

}

  @override
  Future<Either<UserOtpVerifySuccessResponse, UserOtpVerifyErrorResponse>>
  userOtp(
      {required UserOtpVerifyRequest userOtpVerifyRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final clientOtp = await remoteDataSource.userOtp(
            userOtpVerifyRequest: userOtpVerifyRequest);
        return left(clientOtp);
      } on UserOtpVerifyErrorResponse catch (error) {
        printFunc(printName:
            '-------------- on OtpErrorResponse error: $error --------------');
        return Right(error);
      } catch (error) {
        printFunc(printName: '-------------- userOtp error: $error --------------');
        return Right(UserOtpVerifyErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(UserOtpVerifyErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }


  @override
  Future<Either<ForgotPassSuccessResponse, ForgotPassErrorResponse>>
  forgotPassword({required ForgotPassRequest forgotPassRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final forgotPass = await remoteDataSource.forgotPassword(
            forgotPassRequest: forgotPassRequest);
        return left(forgotPass);
      } on ForgotPassErrorResponse catch (error) {
        debugPrint(
            '-------------- on Forgot Password Response error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint(
            '-------------- forgotPassword error: $error --------------');
        return Right(ForgotPassErrorResponse(
            phone: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ForgotPassErrorResponse(phone: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<ResetPasswordSuccessResponse, ResetPasswordErrorResponse>>
  resetPassword(
      {required ResetPasswordRequest resetPasswordRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final resetPassPassword = await remoteDataSource.resetPassword(
            resetPasswordRequest: resetPasswordRequest);
        return left(resetPassPassword);
      } on ResetPasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on ResetPassword error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- ResetPassword error: $error --------------');
        return Right(ResetPasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ResetPasswordErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }


  @override
  Future<Either<ResendOtpSuccessResponse, ResendOtpErrorResponse>> resendOtp(
      {required ResendOtpRequest resendOtpRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final resendOtp = await remoteDataSource.resendOtp(
            resendOtpRequest: resendOtpRequest);
        return left(resendOtp);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on ResendOtp error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- ResendOtp error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<HomeModel, ResendOtpErrorResponse>> getHomeData() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getHomeData = await remoteDataSource.getHomeData();
        return left(getHomeData);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on GetHomeData error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- GetHomeData error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<List<CartItemModel>, ResendOtpErrorResponse>> getHomeDataCategory({required String categoryTitle,required String search}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getFilterHomeData = await remoteDataSource.getHomeDataCategory(categoryTitle: categoryTitle,search: search);
        return left(getFilterHomeData);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on GetFilterHomeData error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- GetFilterHomeData error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<AddDeleteCartItemResponse, ResendOtpErrorResponse>> addCartItem({required AddCartItemRequest addCartItemRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final addItemToCart = await remoteDataSource.addCartItem(addCartItemRequest: addCartItemRequest);
        return left(addItemToCart);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on addItemToCart error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- addItemToCart error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<AddDeleteCartItemResponse, ResendOtpErrorResponse>> deleteCartItem({required int productId}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final deleteItemCart = await remoteDataSource.deleteCartItem(productId: productId);
        return left(deleteItemCart);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on deleteItemCart error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- deleteItemCart error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<GetProfileResponse, ResendOtpErrorResponse>> getProfile() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getProfile = await remoteDataSource.getProfile();
        return left(getProfile);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on getProfile error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- getProfile error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<GetCartModel, ResendOtpErrorResponse>> getCart() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getCart = await remoteDataSource.getCart();
        return left(getCart);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on getCart error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- getCart error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<AddDeleteCartItemResponse, ResendOtpErrorResponse>> deleteCart({required int cartId}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final deleteCartItem = await remoteDataSource.deleteCart(cartId: cartId);
        return left(deleteCartItem);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on deleteCartItem error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- deleteCartItem error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }


  @override
  Future<Either<ItemsUpdate, ResendOtpErrorResponse>> patchCartItem({required PatchCartItemRequest addCartItemRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final patchItemToCart = await remoteDataSource.patchCartItem(addCartItemRequest: addCartItemRequest);
        return left(patchItemToCart);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on patchItemToCart error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- patchItemToCart error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<ChangePasswordSuccessResponse, ResetPasswordErrorResponse>> changePassword({required ChangePasswordRequest resetPasswordRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final changePassword = await remoteDataSource.changePassword(
            resetPasswordRequest: resetPasswordRequest);
        if(changePassword.oldPassword != null){
          return Right(ResetPasswordErrorResponse(
            message: changePassword.oldPassword ?? StringsManager.notFoundError.tr()
          ));
        }
        return left(changePassword);
      } on ResetPasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on changePassword error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- changePassword error: ${error.toString()} --------------');
        return Right(ResetPasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ResetPasswordErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<ChangePasswordSuccessResponse, ChangePasswordErrorResponse>> checkOut({required CheckOutRequest checkOutRequest}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final checkOut = await remoteDataSource.checkOut(
            checkOutRequest: checkOutRequest);
        if(checkOut.url == null){
          return Right(ChangePasswordErrorResponse(
              message: checkOut.message ?? StringsManager.notFoundError.tr()
          ));
        }
        return left(checkOut);
      } on ResetPasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on checkOut error: $error --------------');
        return Right(ChangePasswordErrorResponse(
            message: error.message ?? StringsManager.notFoundError.tr()));
      } catch (error) {
        debugPrint('-------------- checkOut error: ${error.toString()} --------------');
        return Right(ChangePasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ChangePasswordErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<AddCouponResponse, ResetPasswordErrorResponse>> addCoupon({required String coupon}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final addCoupon = await remoteDataSource.addCoupon(
            coupon: coupon);
        if(addCoupon.discount != null){
          return left(addCoupon);
        }
        if(addCoupon.coupon == null){
          return Right(ResetPasswordErrorResponse(
              message: addCoupon.coupon ?? StringsManager.notFoundError.tr()
          ));
        }
        return left(addCoupon);
      } on ResetPasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on addCoupon error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- addCoupon error: ${error.toString()} --------------');
        return Right(ResetPasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ResetPasswordErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<List<GetOrderResponse>, ResetPasswordErrorResponse>> getOrder({required String orderStatus}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getOrder = await remoteDataSource.getOrder(orderStatus: orderStatus);
        return left(getOrder);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on getOrder error: $error --------------');
        return Right(ResetPasswordErrorResponse(
            message: error.message));
      } catch (error) {
        debugPrint('-------------- getOrder error: $error --------------');
        return Right(ResetPasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResetPasswordErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<GetOrderResponse, ResetPasswordErrorResponse>> cancelOrder({required int orderId}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final cancelOrder = await remoteDataSource.cancelOrder(
            orderId: orderId);

        return left(cancelOrder);
      } on ResetPasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on cancelOrder error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- cancelOrder error: ${error.toString()} --------------');
        return Right(ResetPasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ResetPasswordErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<ChangePasswordSuccessResponse, ResetPasswordErrorResponse>> reOrder({required int orderId}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final reOrder = await remoteDataSource.reOrder(
            orderId: orderId);

        return left(reOrder);
      } on ResetPasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on reOrder error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- reOrder error: ${error.toString()} --------------');
        return Right(ResetPasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(ResetPasswordErrorResponse(
          message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<GetProfileResponse, ResendOtpErrorResponse>> patchProfile({required String fullName,required String email}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getProfile = await remoteDataSource.patchProfile(fullName: fullName, email: email);
        return left(getProfile);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on getProfile error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- getProfile error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }

  @override
  Future<Either<ChangePasswordSuccessResponse, ResendOtpErrorResponse>> deleteAccount() async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final deleteAccount = await remoteDataSource.deleteAccount();
        return left(deleteAccount);
      } on ResendOtpErrorResponse catch (error) {
        debugPrint('-------------- on deleteAccount error: $error --------------');
        return Right(error);
      } catch (error) {
        debugPrint('-------------- deleteAccount error: $error --------------');
        return Right(ResendOtpErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Right(
          ResendOtpErrorResponse(message: StringsManager.notFoundError.tr()));
    }
  }



}
