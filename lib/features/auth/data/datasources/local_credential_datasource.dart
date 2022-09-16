import 'package:firebase_auth/firebase_auth.dart';

abstract class LocalCredentialDatasource {
  PhoneAuthCredential? getCredentialFromPhoneNumber(String phoneNumber);

  setCredentialOfPhoneNumber({
    required String phoneNumber,
    required PhoneAuthCredential credential,
  });
}

class InMemoryLocalCredentialDatasource implements LocalCredentialDatasource {
  final Map<String, AuthCredential> cache = {};
  @override
  PhoneAuthCredential? getCredentialFromPhoneNumber(String phoneNumber) {
    return cache[phoneNumber] as PhoneAuthCredential?;
  }

  @override
  setCredentialOfPhoneNumber({required String phoneNumber, required PhoneAuthCredential credential}) {
    cache[phoneNumber] = credential;
  }
}