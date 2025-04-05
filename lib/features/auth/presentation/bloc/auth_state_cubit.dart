import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_management_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:truck_management_app/features/auth/domain/usecases/is_signedin.dart';
import 'package:truck_management_app/service_locator.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AppInitialState());

  void appStarted() async {
    final isSignedIn = await getIt<IsSignedInUsecase>().call(null);
    if (isSignedIn) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }

  void signInSuccess() {
    emit(AuthenticatedState());
  }

  void signOut() {
    emit(UnauthenticatedState());
  }
}
