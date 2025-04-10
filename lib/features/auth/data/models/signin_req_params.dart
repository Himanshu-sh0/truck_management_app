import 'package:truck_management_app/features/auth/domain/entities/signin_req_params.dart';

class SigninReqParamsModel   extends SigninReqParams {
  SigninReqParamsModel({required super.email, required super.password});

  Map<String, dynamic> toJson() => <String, dynamic>{
    "user": {'email': email, 'password': password},
  };

  factory SigninReqParamsModel.fromEntity(
    SigninReqParams entity,
  ) {
    return SigninReqParamsModel(
      email: entity.email,
      password: entity.password,
    );
  }
}
