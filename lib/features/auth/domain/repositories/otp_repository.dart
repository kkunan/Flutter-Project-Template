
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';



abstract class OtpRepository {
  Future<AppResponse<bool>> requestOtpWithPhoneNumber(
      {required String phoneNumber});

  Future<AppResponse<User>> verifyOtpAndGetUser(
      {required String phoneNumber, required String otp,});
}