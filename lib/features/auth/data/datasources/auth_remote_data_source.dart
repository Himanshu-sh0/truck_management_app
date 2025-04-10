import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truck_management_app/core/constants/api_urls.dart';
import 'package:truck_management_app/core/network/api/dio_client.dart';
import 'package:truck_management_app/core/util/helpers/exception_capture.dart';
import 'package:truck_management_app/features/auth/data/models/forgot_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/reset_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signin_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signup_req_params.dart';
import 'package:truck_management_app/service_locator.dart';

abstract class AuthRemoteDataSource {
  Future<Either> signIn(SigninReqParamsModel params);

  Future<Either> signUp(SignupReqParamsModel params);

  Future<Either> signOut();

  Future<Either> resetPassword(ResetPasswordReqParamsModel params);

  Future<Either> forgotPassword(ForgotPasswordReqParamsModel params);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either> signIn(SigninReqParamsModel params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.signInPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return exceptionCapture(e, "Authenticating the device");
    }
  }

  @override
  Future<Either> signUp(SignupReqParamsModel params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.signUpPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return exceptionCapture(e, "Creating the account");
    }
  }

  @override
  Future<Either> signOut() async {
    return Right(null);
  }

  @override
  Future<Either> resetPassword(ResetPasswordReqParamsModel params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.resetPasswordPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return exceptionCapture(e, "Resetting the password");
    }
  }

  @override
  Future<Either> forgotPassword(ForgotPasswordReqParamsModel params) async {
    try {
      final response = await getIt<DioClient>().post(
        ApiUrls.baseUrl + ApiUrls.forgotPasswordPath,
        data: params.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return exceptionCapture(e, "Forgetting the password");
    }
  }
}

