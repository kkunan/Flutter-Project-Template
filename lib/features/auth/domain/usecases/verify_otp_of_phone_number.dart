import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/otp_repository.dart';

class VerifyOtpAndGetUserFromPhoneNumber {
  final OtpRepository authRepository;

  VerifyOtpAndGetUserFromPhoneNumber(this.authRepository);

  Future<AppResponse<User>> call({
    required String phoneNumber,
    required String inputOtp,
  }) async {
    return await authRepository.verifyOtpAndGetUser(
        phoneNumber: phoneNumber, otp: inputOtp);
  }
}

class VerifyOtpError extends AppError {
  const VerifyOtpError({required super.errorMessage});

  static const shouldReTryRequestOtp =
      VerifyOtpError(errorMessage: 'ไม่สามารถตรวจสอบ OTP กรุณาขอ OTP อีกครั้ง');
  static const shouldRetrySubmitOtp =
      VerifyOtpError(errorMessage: 'ตรวจสอบ OTP ไม่สำเร็จ กรุณาลองอีกครั้ง');
  static const shouldContactAdmin = VerifyOtpError(
      errorMessage: 'ไม่สามารถเข้าถึงบัญชีนี้ได้ กรุณาติดต่อเจ้าหน้าที่');
  static const incorrectOtp = VerifyOtpError(
      errorMessage: 'OTP ไม่ถูกต้อง กรุณาลองอีกครั้ง');
}
