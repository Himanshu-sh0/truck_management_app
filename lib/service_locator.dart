import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:truck_management_app/core/network/api/dio_client.dart';
import 'package:truck_management_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:truck_management_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:truck_management_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:truck_management_app/features/auth/domain/usecases/forgot_password.dart';
import 'package:truck_management_app/features/auth/domain/usecases/is_signedin.dart';
import 'package:truck_management_app/features/auth/domain/usecases/reset_password.dart';
import 'package:truck_management_app/features/auth/domain/usecases/signin.dart';
import 'package:truck_management_app/features/auth/domain/usecases/signup.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<SigninUsecase>(SigninUsecase());
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<IsSignedInUsecase>(IsSignedInUsecase());
  getIt.registerSingleton<ForgotPasswordUsecase>(ForgotPasswordUsecase());
  getIt.registerSingleton<ResetPasswordUsecase>(ResetPasswordUsecase());
}
