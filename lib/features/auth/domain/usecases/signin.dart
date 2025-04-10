import 'package:dartz/dartz.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/core/usecases/usecase.dart';
import 'package:truck_management_app/features/auth/domain/entities/signin_req_params.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';

class SigninUsecase extends Usecase<Either, SigninReqParams> {
  @override
  Future<Either> call(SigninReqParams params) async => getIt<AuthRepository>().signIn(params);
}
