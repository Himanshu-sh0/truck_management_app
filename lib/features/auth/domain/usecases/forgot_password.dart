import 'package:dartz/dartz.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/core/usecases/usecase.dart';
import 'package:truck_management_app/features/auth/domain/entities/forgot_password_req_params.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase implements Usecase<Either, ForgotPasswordReqParams> {
  @override
  Future<Either> call(ForgotPasswordReqParams params) async =>
      getIt<AuthRepository>().forgotPassword(params);
}
