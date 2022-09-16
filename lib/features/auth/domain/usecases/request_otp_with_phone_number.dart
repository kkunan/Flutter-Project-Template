import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/otp_repository.dart';

class RequestOtpWithPhoneNumber {
  final OtpRepository userRepository;

  RequestOtpWithPhoneNumber(this.userRepository);

  Future<AppResponse<bool>> call(String phoneNumber) async {
    return await userRepository.requestOtpWithPhoneNumber(
        phoneNumber: phoneNumber);
  }
}

class RequestOtpError extends AppError {
  const RequestOtpError({required super.errorMessage});

  static const verifyNumberFailed = RequestOtpError(
      errorMessage:
          'เกิดข้อผิดพลาด กรุณาตรวจสอบหมายเลขโทรศัพท์ที่ใช้ลงทะเบียน');
  static const timeout = RequestOtpError(
      errorMessage: 'ไม่ได้รับการตอบสนองจากระบบ กรุณาลองอีกครั้งภายหลัง');
}
