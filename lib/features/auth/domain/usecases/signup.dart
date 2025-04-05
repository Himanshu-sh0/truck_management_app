import 'package:dartz/dartz.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/core/usecases/usecase.dart';
import 'package:truck_management_app/features/auth/data/models/signup_req_params.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase implements Usecase<Either, SignupReqParams> {
  @override
  Future<Either> call(SignupReqParams params) async =>
      getIt<AuthRepository>().signUp(params);
}
