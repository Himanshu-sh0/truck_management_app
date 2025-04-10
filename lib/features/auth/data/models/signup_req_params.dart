import 'package:truck_management_app/features/auth/domain/entities/signup_req_params.dart';

class SignupReqParamsModel extends SignupReqParams {
  SignupReqParamsModel({
    required super.email,
    required super.password,
    required super.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "user": {
      // 'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    },
  };

  factory SignupReqParamsModel.fromEntity(
    SignupReqParams entity,
  ) {
    return SignupReqParamsModel(
      email: entity.email,
      password: entity.password,
      passwordConfirmation: entity.passwordConfirmation,
    );
  }
}