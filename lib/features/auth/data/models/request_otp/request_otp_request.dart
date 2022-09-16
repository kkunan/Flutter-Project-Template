import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_otp_request.freezed.dart';
@freezed
class RequestOtpRequest with _$RequestOtpRequest {
  factory RequestOtpRequest({
    required String phoneNumber,
  }) = _RequestOtpRequest;
}
