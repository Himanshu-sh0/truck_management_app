import 'package:truck_management_app/features/auth/domain/entities/reset_password_req_params.dart';

class ResetPasswordReqParamsModel  extends ResetPasswordReqParams {
  ResetPasswordReqParamsModel({
    required super.password,
    required super.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "user": {
      "password": password,
      "password_confirmation": passwordConfirmation,
    },
  };

  factory ResetPasswordReqParamsModel.fromEntity(
    ResetPasswordReqParams entity,
  ) {
    return ResetPasswordReqParamsModel(
      password: entity.password,
      passwordConfirmation: entity.passwordConfirmation,
    );
  }
}
