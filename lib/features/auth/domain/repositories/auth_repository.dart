import 'package:dartz/dartz.dart';
import 'package:truck_management_app/features/auth/data/models/forgot_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/reset_password_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signin_req_params.dart';
import 'package:truck_management_app/features/auth/data/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninReqParams params);

  Future<Either> signUp(SignupReqParams params);

  Future<Either> signOut();

  Future<Either> resetPassword(ResetPasswordReqParams params);

  Future<Either> forgotPassword(ForgotPasswordReqParams params);

  Future<bool> isSignedIn();
}
