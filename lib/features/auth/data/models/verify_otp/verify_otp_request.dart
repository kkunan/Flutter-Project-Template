import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_otp_request.freezed.dart';
@freezed
class VerifyOtpRequest with _$VerifyOtpRequest {
  factory VerifyOtpRequest({
    required PhoneAuthCredential credential,
    required String otp,
  }) = _VerifyOtpRequest;
}