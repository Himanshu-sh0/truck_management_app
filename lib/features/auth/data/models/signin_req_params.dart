import 'package:truck_management_app/features/auth/domain/entities/signin_req_params.dart';

class SigninReqParams extends SigninReqParamsEntity {
  SigninReqParams({required super.email, required super.password});

  Map<String, dynamic> toJson() => <String, dynamic>{
    "user": {'email': email, 'password': password},
  };
}
