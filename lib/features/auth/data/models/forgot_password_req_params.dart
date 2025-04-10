import 'package:truck_management_app/features/auth/domain/entities/forgot_password_req_params.dart';

class ForgotPasswordReqParamsModel extends ForgotPasswordReqParams {
  ForgotPasswordReqParamsModel({required super.email});

  Map<String, dynamic> toJson() => <String, dynamic>{
    "email": email,
  };

  factory ForgotPasswordReqParamsModel.fromEntity(
    ForgotPasswordReqParams entity,
  ) {
    return ForgotPasswordReqParamsModel(
      email: entity.email,
    );
  }
}
