import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truck_management_app/core/error/failures.dart';

Left exceptionCapture(DioException e, String action) {
  final data = e.response?.data;
  final errorMessage = 'There is an issue $action. Please try again.';
  if (data == null) {
    return Left(GeneralFailure(errorMessage));
  }
  return data.containsKey('message')
      ? Left(AuthFailure(data['message']))
      : Left(GeneralFailure(errorMessage));
}
