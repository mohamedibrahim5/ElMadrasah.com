import '../../model/requests/add_cart_item_request.dart';
import '../../model/requests/check_out_request.dart';
import '../../model/requests/forgot_pass_request.dart';
import '../../model/requests/login_request.dart';
import '../../model/requests/otp_verfiy_request.dart';
import '../../model/requests/register_request.dart';
import '../../model/requests/resend_otp_request.dart';
import '../../model/requests/reset_pass_request.dart';
import '../../model/responses/add_coupon_response.dart';
import '../../model/responses/add_delete_cart_item_response.dart';
import '../../model/responses/forgot_pass_response.dart';
import '../../model/responses/get_cart_model.dart';
import '../../model/responses/get_home_response.dart';
import '../../model/responses/get_order_response.dart';
import '../../model/responses/get_profile_response.dart';
import '../../model/responses/login_response.dart';
import '../../model/responses/otp_verify_response.dart';
import '../../model/responses/register_response.dart';
import '../../model/responses/resend_otp_response.dart';
import '../../model/responses/reset_pass_response.dart';

abstract class RemoteDataSource {

  Future<UserRegisterSuccessResponse> register(
      {required UserRegisterRequest registerRequest});

  Future<LoginSuccessResponse> login({required LoginRequest loginRequest});


  Future<LoginSuccessResponse> getUserProfile();

  Future<UserOtpVerifySuccessResponse> userOtp(
      {required UserOtpVerifyRequest userOtpVerifyRequest});

  Future<ForgotPassSuccessResponse> forgotPassword(
      {required ForgotPassRequest forgotPassRequest});

  Future<ResetPasswordSuccessResponse> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest});

  Future<ResendOtpSuccessResponse> resendOtp(
      {required ResendOtpRequest resendOtpRequest});

  Future<HomeModel> getHomeData();
  Future<List<CartItemModel>> getHomeDataCategory({required String categoryTitle,required String search});

  Future<AddDeleteCartItemResponse> addCartItem({required AddCartItemRequest addCartItemRequest});

  Future<AddDeleteCartItemResponse> deleteCartItem({required int productId});

  Future<GetProfileResponse> getProfile();

  Future<GetCartModel> getCart() ;

  Future<GetProfileResponse> patchProfile({required String fullName,required String email});

  Future<AddDeleteCartItemResponse> deleteCart({required int cartId});

  Future<ItemsUpdate> patchCartItem({required PatchCartItemRequest addCartItemRequest});

  Future<ChangePasswordSuccessResponse> changePassword(
      {required ChangePasswordRequest resetPasswordRequest});

  Future<ChangePasswordSuccessResponse> checkOut(
      {required CheckOutRequest checkOutRequest});

  Future<AddCouponResponse> addCoupon(
      {required String coupon});


  Future<List<GetOrderResponse>> getOrder(
      {required String orderStatus});

  Future<GetOrderResponse> cancelOrder(
      {required int orderId});

  Future<ChangePasswordSuccessResponse> reOrder({required int orderId});

  Future<ChangePasswordSuccessResponse> deleteAccount();


}
