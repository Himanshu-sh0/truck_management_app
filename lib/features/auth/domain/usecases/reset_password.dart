import 'package:dartz/dartz.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/core/usecases/usecase.dart';
import 'package:truck_management_app/features/auth/data/models/reset_password_req_params.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase implements Usecase<Either, ResetPasswordReqParams> {
  @override
  Future<Either> call(ResetPasswordReqParams params) async =>
      getIt<AuthRepository>().resetPassword(params);
}
