import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_otp_response.freezed.dart';

@freezed
class RequestOtpResponse with _$RequestOtpResponse {
  factory RequestOtpResponse({
    PhoneAuthCredential? credential,
    String? verificationId,
    int? resendToken,
    FirebaseAuthException? exception,
    @Default(false) bool isTimeout
  }) = _RequestOtpResponse;
}
