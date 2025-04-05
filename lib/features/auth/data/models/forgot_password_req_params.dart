import 'package:truck_management_app/features/auth/domain/entities/forgot_password_req_params.dart';

class ForgotPasswordReqParams extends ForgotPasswordReqParamsEntity {
  ForgotPasswordReqParams({required super.email});
    
  Map<String, dynamic> toJson() => <String, dynamic>{
    "email": email,
  };
}
