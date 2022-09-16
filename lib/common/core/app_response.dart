import 'package:equatable/equatable.dart';

import 'app_error.dart';

class AppResponse<T> extends Equatable {
  final T? value;
  final AppError? error;
  AppResponse({required this.value, required this.error});

  @override
  List<Object?> get props => [value, error];
}