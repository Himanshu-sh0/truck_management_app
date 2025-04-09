import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_management_app/common/bloc/button/button_state.dart';
import 'package:truck_management_app/core/error/failures.dart';
import 'package:truck_management_app/core/usecases/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingState());
    await Future<void>.delayed(const Duration(seconds: 2));
    try {
      final result = await usecase.call(params);
      result.fold(
        (failure) {
          emit(ButtonFailureState(error: failure));
        },
        (success) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(error: GeneralFailure(e.toString())));
    }
  }
}
