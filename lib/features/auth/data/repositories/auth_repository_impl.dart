import 'package:dartz/dartz.dart';
import 'package:truck_management_app/features/auth/data/models/forgot_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/reset_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signin_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signup_req_params.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:truck_management_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:truck_management_app/features/auth/domain/entities/forgot_password_req_params.dart';
import 'package:truck_management_app/features/auth/domain/entities/reset_password_req_params.dart';
import 'package:truck_management_app/features/auth/domain/entities/signin_req_params.dart';
import 'package:truck_management_app/features/auth/domain/entities/signup_req_params.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninReqParams params) async {
    final Either result = await getIt<AuthRemoteDataSource>().signIn(SigninReqParamsModel.fromEntity(params));
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        if (data != null && data['token'] != null) {
          await getIt<AuthLocalDataSource>().saveToken(data['token']);
        }
        return Right(data['message']);
      },
    );
  }

  @override
  Future<Either> signUp(SignupReqParams params) async {
    final Either result = await getIt<AuthRemoteDataSource>().signUp(SignupReqParamsModel.fromEntity(params));
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        if (data != null && data['token'] != null) {
          await getIt<AuthLocalDataSource>().saveToken(data['token']);
        }
        return Right(data['message']);
      },
    );
  }

  @override
  Future<Either> signOut() async {
    try {
      await getIt<AuthLocalDataSource>().deleteToken();
      return Right('Signed out successfully');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> resetPassword(ResetPasswordReqParams params) async {
    return getIt<AuthRemoteDataSource>().resetPassword(ResetPasswordReqParamsModel.fromEntity(params));
  }

  @override
  Future<Either> forgotPassword(ForgotPasswordReqParams params) async {
    return getIt<AuthRemoteDataSource>().forgotPassword(ForgotPasswordReqParamsModel.fromEntity(params));
  }

  @override
  Future<bool> isSignedIn() async {
    return await getIt<AuthLocalDataSource>().isSignedIn();
  }
}
