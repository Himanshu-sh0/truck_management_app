import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/core/usecases/usecase.dart';
import 'package:truck_management_app/features/auth/domain/repositories/auth_repository.dart';

class IsSignedInUsecase implements Usecase<bool, Null> {
  @override
  Future<bool> call(Null params) async => getIt<AuthRepository>().isSignedIn();
}
