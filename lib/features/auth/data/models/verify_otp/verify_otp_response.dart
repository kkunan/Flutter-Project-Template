import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_otp_response.freezed.dart';
@freezed
class VerifyOtpResponse with _$VerifyOtpResponse {
  factory VerifyOtpResponse({
    UserCredential? credential,
    FirebaseAuthException? exception,
  }) = _VerifyOtpResponse;
}