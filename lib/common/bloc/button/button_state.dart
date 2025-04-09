import 'package:truck_management_app/core/error/failures.dart';

abstract class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailureState extends ButtonState {
  final Failure error;
  ButtonFailureState({required this.error});
}
