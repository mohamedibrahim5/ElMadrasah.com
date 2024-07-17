import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:test_project/data/remote/remote_datasource.dart';

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
import '../../shared/resources/constant.dart';
import '../../shared/resources/dio_helper.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;
  final DioHelper dioHelper;

  RemoteDataSourceImpl({required this.dio, required this.dioHelper});
  var url = Uri.https('example.com', 'whatsit/create');
  @override
  Future<UserRegisterSuccessResponse> register(
      {required UserRegisterRequest registerRequest}) async {
    dioHelper.removeHeader();
    final response =
    await http.post(url, body: registerRequest.toJson());
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (response.statusCode == 201) {
      return UserRegisterSuccessResponse.fromJson(json:decodedResponse);
    }else if (response.statusCode == 403) {
      return UserRegisterSuccessResponse.fromNotVerified(json: decodedResponse);
    } else {
      throw UserRegisterErrorResponse.fromJson(json: decodedResponse);
    }
  }

  @override
  Future<LoginSuccessResponse> login(
      {required LoginRequest loginRequest}) async {

    Uri url = Uri.parse('${Constants.baseUrl}${Constants.loginUrl}');
    var response = await http.post(
        url,
        body: loginRequest.toJson(),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {

      return LoginSuccessResponse.fromJson(json:data);
    }
    else {
      throw LoginErrorResponse.fromJson(json: data);
    }

    // dioHelper.removeHeader();
    // final response =
    // await dio.post(Constants.loginUrl, data: loginRequest.toJson());
    //
    // if (response.statusCode == 200) {
    //   return LoginSuccessResponse.fromJson(json: response.data);
    // } else if (response.statusCode == 403) {
    //   return LoginSuccessResponse.fromNotVerified(json: response.data);
    // } else {
    //   throw LoginErrorResponse.fromJson(json: response.data);
    // }
  }

  @override
  Future<LoginSuccessResponse> getUserProfile() async {

    // String value = await sl<PrefsHelper>().getToken();
    // dio.options.headers['Authorization'] = 'Bearer ${value}' ;
    dioHelper.addHeaders();
    final response =
        await dio.get(Constants.getUserProfile,);

    if (response.statusCode == 200) {
      return LoginSuccessResponse.fromJson(json: response.data);
    } else if (response.statusCode == 403) {
      return LoginSuccessResponse.fromNotVerified(json: response.data);
    } else {
      throw LoginErrorResponse.fromJson(json: response.data);
    }
  }


  @override
  Future<UserOtpVerifySuccessResponse> userOtp(
      {required UserOtpVerifyRequest userOtpVerifyRequest}) async {
    final response = await dio.post(Constants.verifyOtpClient,
        data: userOtpVerifyRequest.toJson());
    if (response.statusCode == 200) {
      return UserOtpVerifySuccessResponse.fromJson(json: response.data);
    } else {
      throw UserOtpVerifyErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ForgotPassSuccessResponse> forgotPassword(
      {required ForgotPassRequest forgotPassRequest}) async {
    final response = await dio.post(Constants.resendOtp,
        data: forgotPassRequest.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ForgotPassSuccessResponse.fromJson(json: response.data);
    } else {
      throw ForgotPassErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ResetPasswordSuccessResponse> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest}) async {
    final response = await dio.patch(Constants.resetPassUrl,
        data: resetPasswordRequest.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ResetPasswordSuccessResponse.fromJson(json: response.data);
    } else {
      throw ResetPasswordErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ResendOtpSuccessResponse> resendOtp(
      {required ResendOtpRequest resendOtpRequest}) async {
    final response =
    await dio.post(Constants.resendOtp, data: resendOtpRequest.toJson());
    if (response.statusCode == 200) {
      return ResendOtpSuccessResponse.fromJson(json: response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<HomeModel> getHomeData() async {
    dioHelper.addHeaders();
    final response =
        await dio.get(Constants.getHomeDataUrl);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<List<CartItemModel>> getHomeDataCategory({required String categoryTitle,required String search}) async {
    dioHelper.addHeaders();
    final response =
        await dio.get(Constants.getHomeCategoryDataUrl, queryParameters: {
          if(categoryTitle.isNotEmpty)
            'category__title': categoryTitle,
          if(search.isNotEmpty)
            'title': search

        });
    if (response.statusCode == 200) {
      return List.from(response.data)
          .map((category) => CartItemModel.fromJson(category))
          .toList();
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddDeleteCartItemResponse> addCartItem({required AddCartItemRequest addCartItemRequest}) async {
    dioHelper.addHeaders();
    final response =
        await dio.post(Constants.addCartItemUrl, data: addCartItemRequest.toJson());
    if (response.statusCode == 201) {
      return AddDeleteCartItemResponse.fromJson(json: response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddDeleteCartItemResponse> deleteCartItem({required int productId}) async {
    dioHelper.addHeaders();
    final response =
        await dio.delete(Constants.deleteCartItemUrl, data: {
          'product_id': productId
        });
    if (response.statusCode == 200) {
      return AddDeleteCartItemResponse.fromJson(json: response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<GetProfileResponse> getProfile() async {
    await dioHelper.addHeaders();
    final response =
        await dio.get(Constants.profileUrl);
    if (response.statusCode == 200) {
      return GetProfileResponse.fromJson(response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<GetCartModel> getCart() async {
    await dioHelper.addHeaders();
    final response =
        await dio.get(Constants.getCart);
    if (response.statusCode == 200) {
      return GetCartModel.fromJson(response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddDeleteCartItemResponse> deleteCart({required int cartId}) async {
    await dioHelper.addHeaders();
    final response =
        await dio.delete(Constants.deleteCartItemUrl, data: {
          'cart_item_id': cartId
        });
    if (response.statusCode == 200) {
      return AddDeleteCartItemResponse.fromJson(json: response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ItemsUpdate> patchCartItem({required PatchCartItemRequest addCartItemRequest}) async {
    dioHelper.addHeaders();
    final response =
    await dio.patch(Constants.deleteCartItemUrl, data: addCartItemRequest.toJson());
    if (response.statusCode == 200) {
      return ItemsUpdate.fromJson(response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ChangePasswordSuccessResponse> changePassword({required ChangePasswordRequest resetPasswordRequest}) async {
    dioHelper.addHeaders();
    final response = await dio.patch(Constants.changePassUrl,
        data: resetPasswordRequest.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ChangePasswordSuccessResponse.fromJson(json: response.data);
    }else  if (response.statusCode == 400 ) {
      return ChangePasswordSuccessResponse.fromNotVerified(json: response.data);
    } else {
      throw ChangePasswordSuccessResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ChangePasswordSuccessResponse> checkOut({required CheckOutRequest checkOutRequest}) async {
    dioHelper.addHeaders();
    final response = await dio.post(Constants.checkOut,
        data: checkOutRequest.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ChangePasswordSuccessResponse.fromJson(json: response.data);
    }else if (response.statusCode == 400){
      return ChangePasswordSuccessResponse.fromNotVerified(json: response.data);
    }
      else {
      throw ChangePasswordSuccessResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<AddCouponResponse> addCoupon({required String coupon}) async {
    dioHelper.addHeaders();
    final response = await dio.post(Constants.addCoupon,
        data: {
          'coupon': coupon
        });
    if (response.statusCode == 201 || response.statusCode == 200) {
      return AddCouponResponse.fromJson(json: response.data);
    }else  if (response.statusCode == 400 ) {
      return AddCouponResponse.fromNotVerified(json: response.data);
    } else {
      throw ChangePasswordSuccessResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<List<GetOrderResponse>> getOrder({required String orderStatus}) async {
    dioHelper.addHeaders();
    final response =
        await dio.get(Constants.getOrder, queryParameters: {
          'order_status': orderStatus
    });
    if (response.statusCode == 200) {
      return List.from(response.data)
          .map((category) => GetOrderResponse.fromJson(category))
          .toList();
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<GetOrderResponse> cancelOrder({required int orderId}) async {
    dioHelper.addHeaders();
    final response = await dio.post(Constants.cancelOrder,
        data: {
          'order_id': orderId
        });
    if (response.statusCode == 201 || response.statusCode == 200) {
      return GetOrderResponse.fromJson(response.data);
    } else {
      throw ChangePasswordSuccessResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ChangePasswordSuccessResponse> reOrder({required int orderId}) async {
    dioHelper.addHeaders();
    final response = await dio.post('food/orders/$orderId/reorder/');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ChangePasswordSuccessResponse.fromJson(json: response.data);
    } else {
      throw ChangePasswordSuccessResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<GetProfileResponse> patchProfile({required String fullName,required String email}) async {
    await dioHelper.addHeaders();
    final response =
        await dio.patch(Constants.profileUrl,data: {
          'full_name': fullName,
          'email': email
        });
    if (response.statusCode == 200) {
      return GetProfileResponse.fromJson(response.data);
    } else {
      throw ResendOtpErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ChangePasswordSuccessResponse> deleteAccount() async {
    await dioHelper.addHeaders();
    final response =
        await dio.delete(Constants.deleteAccount);
    if (response.statusCode == 200) {
      return ChangePasswordSuccessResponse.fromJson(json: response.data);
    } else {
      throw ChangePasswordSuccessResponse.fromJson(json: response.data);
    }
  }

}