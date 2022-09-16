import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String errorMessage;

  const AppError({required this.errorMessage});

  static const noInternet = AppError(errorMessage: 'ไม่พบสัญญาณอินเทอร์เน็ต');
  static const unknown =
      AppError(errorMessage: 'เกิดข้อผิดพลาด กรุณาลองภายหลัง');

  @override
  List<Object?> get props => [errorMessage];
}
