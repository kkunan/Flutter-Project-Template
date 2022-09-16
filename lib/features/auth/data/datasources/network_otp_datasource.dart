import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_response.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_response.dart';
import '../models/request_otp/request_otp_request.dart';

abstract class NetworkOtpDatasource {
  Future<RequestOtpResponse> requestOtp(RequestOtpRequest request);

  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request);
}

class FirebaseAuthOtpDatasource extends NetworkOtpDatasource {
  final FirebaseAuth auth;
  final PhoneAuthProviderWrapper phoneAuthProviderWrapper;

  FirebaseAuthOtpDatasource(
      {required this.auth, required this.phoneAuthProviderWrapper});

  @override
  Future<RequestOtpResponse> requestOtp(RequestOtpRequest request) async {
    final completer = Completer<RequestOtpResponse>();
    await auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {
          completer.complete(RequestOtpResponse(
              credential: credential,
              verificationId: credential.verificationId));
        },
        phoneNumber: request.phoneNumber,
        verificationFailed: (FirebaseAuthException e) {
          completer.complete(RequestOtpResponse(
            exception: e,
          ));
        },
        codeSent: (String verificationId, int? resendToken) async {},
        codeAutoRetrievalTimeout: (String verificationId) {
          completer.complete(RequestOtpResponse(
            verificationId: verificationId,
            isTimeout: true,
          ));
        });
    return completer.future;
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request) async {
    final verificationId = request.credential.verificationId;

    if (verificationId != null) {
      final credential = phoneAuthProviderWrapper.getCredential(
          verificationId: verificationId, smsCode: request.otp);
      if (credential != null) {
        try {
          final signedInCredential =
              await auth.signInWithCredential(credential);
          return VerifyOtpResponse(credential: signedInCredential);
        } catch (exception) {
          if (exception is FirebaseAuthException) {
            return VerifyOtpResponse(exception: exception);
          }
        }
      }
    }
    return VerifyOtpResponse();
  }
}

class PhoneAuthProviderWrapper {
  PhoneAuthCredential? getCredential(
          {required String verificationId, required String smsCode}) =>
      PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
}
