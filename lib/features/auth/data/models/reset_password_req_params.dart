import 'package:truck_management_app/features/auth/domain/entities/reset_password_req_params.dart';

class ResetPasswordReqParams extends ResetPasswordReqParamsEntity {
  ResetPasswordReqParams({
    required super.password,
    required super.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "user": {
      "password": password,
      "password_confirmation": passwordConfirmation,
    },
  };
}
