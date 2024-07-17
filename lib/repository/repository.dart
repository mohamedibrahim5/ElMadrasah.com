import 'package:dartz/dartz.dart';

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


abstract class Repository {
  Future<Either<UserRegisterSuccessResponse, UserRegisterErrorResponse>>
  registerClient({required UserRegisterRequest clientRegisterRequest});

  Future<Either<LoginSuccessResponse, LoginErrorResponse>> login(
      {required LoginRequest loginRequest});

  Future<Either<LoginSuccessResponse, LoginErrorResponse>> getUserProfile();

  Future<Either<UserOtpVerifySuccessResponse, UserOtpVerifyErrorResponse>>
  userOtp({required UserOtpVerifyRequest userOtpVerifyRequest});

  Future<Either<ForgotPassSuccessResponse, ForgotPassErrorResponse>>
  forgotPassword({required ForgotPassRequest forgotPassRequest});

  Future<Either<ResetPasswordSuccessResponse, ResetPasswordErrorResponse>>
  resetPassword({required ResetPasswordRequest resetPasswordRequest});

  Future<Either<ResendOtpSuccessResponse, ResendOtpErrorResponse>> resendOtp(
      {required ResendOtpRequest resendOtpRequest});

  Future<Either<HomeModel, ResendOtpErrorResponse>> getHomeData();


  Future<Either<List<CartItemModel>, ResendOtpErrorResponse>> getHomeDataCategory({required String categoryTitle,required String search});

  Future<Either<AddDeleteCartItemResponse, ResendOtpErrorResponse>> addCartItem({required AddCartItemRequest addCartItemRequest});

  Future<Either<AddDeleteCartItemResponse, ResendOtpErrorResponse>> deleteCartItem({required int productId});

  Future<Either<GetProfileResponse, ResendOtpErrorResponse>> getProfile();

  Future<Either<GetCartModel, ResendOtpErrorResponse>> getCart();

  Future<Either<AddDeleteCartItemResponse, ResendOtpErrorResponse>> deleteCart({required int cartId});

  Future<Either<ItemsUpdate, ResendOtpErrorResponse>> patchCartItem({required PatchCartItemRequest addCartItemRequest});

  Future<Either<ChangePasswordSuccessResponse, ResetPasswordErrorResponse>>
  changePassword({required ChangePasswordRequest resetPasswordRequest});


  Future<Either<ChangePasswordSuccessResponse, ChangePasswordErrorResponse>>
  checkOut({required CheckOutRequest checkOutRequest});

  Future<Either<AddCouponResponse, ResetPasswordErrorResponse>>
  addCoupon({required String coupon});


  Future<Either<List<GetOrderResponse>, ResetPasswordErrorResponse>>
  getOrder({required String orderStatus});

  Future<Either<GetOrderResponse, ResetPasswordErrorResponse>>
  cancelOrder({required int orderId});

  Future<Either<ChangePasswordSuccessResponse, ResetPasswordErrorResponse>> reOrder({required int orderId});

  Future<Either<GetProfileResponse, ResendOtpErrorResponse>> patchProfile({required String fullName,required String email});

  Future<Either<ChangePasswordSuccessResponse, ResendOtpErrorResponse>> deleteAccount();


}
