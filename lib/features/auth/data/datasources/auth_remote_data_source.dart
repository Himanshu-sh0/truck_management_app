import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truck_management_app/core/constants/api_urls.dart';
import 'package:truck_management_app/core/error/failures.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/core/network/api/dio_client.dart';
import 'package:truck_management_app/features/auth/data/models/forgot_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/reset_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signin_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signup_req_params.dart';

abstract class AuthRemoteDataSource {
  Future<Either> signIn(SigninReqParams params);

  Future<Either> signUp(SignupReqParams params);

  Future<Either> signOut();

  Future<Either> resetPassword(ResetPasswordReqParams params);

  Future<Either> forgotPassword(ForgotPasswordReqParams params);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either> signIn(SigninReqParams params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.signInPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return _exceptionCapture(e, "Authenticating the device");
    }
  }

  @override
  Future<Either> signUp(SignupReqParams params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.signUpPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return _exceptionCapture(e, "Creating the account");
    }
  }

  @override
  Future<Either> signOut() async {
    return Right(null);
  }

  @override
  Future<Either> resetPassword(ResetPasswordReqParams params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.resetPasswordPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return _exceptionCapture(e, "Resetting the password");
    }
  }

  @override
  Future<Either> forgotPassword(ForgotPasswordReqParams params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.forgotPasswordPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return _exceptionCapture(e, "Forgetting the password");
    }
  }
}

Left _exceptionCapture(DioException e, String action) {
  final data = e.response?.data;
  final errorMessage = 'There is an issue $action. Please try again.';
  if (data == null) {
    return Left(GeneralFailure(errorMessage));
  }
  return data.containsKey('message')
      ? Left(AuthFailure(data['message']))
      : Left(GeneralFailure(errorMessage));
}
