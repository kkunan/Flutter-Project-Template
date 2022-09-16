import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_otp_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_response.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_response.dart';

import '../../../../utils/random_value.dart';
import 'network_otp_datasource_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  PhoneAuthCredential,
  FirebaseAuthException,
  PhoneAuthProviderWrapper,

  UserCredential,
])
void main() {
  late MockFirebaseAuth auth;
  late MockPhoneAuthProviderWrapper wrapper;
  late FirebaseAuthOtpDatasource datasource;
  setUp(() {
    auth = MockFirebaseAuth();
    wrapper = MockPhoneAuthProviderWrapper();
    when(wrapper.getCredential(verificationId: anyNamed('verificationId'), smsCode: anyNamed('smsCode'))).thenReturn(MockPhoneAuthCredential());

    datasource = FirebaseAuthOtpDatasource(auth: auth, phoneAuthProviderWrapper: wrapper);
  });

  group('requestOtp', () {
    test('should call auth.verifyPhoneNumber with number in request', () {
      // arrange
      final phoneNumber = getRandomString(10);
      when(auth.verifyPhoneNumber(
        phoneNumber: anyNamed('phoneNumber'),
      )).thenAnswer((_) async {});

      // act
      datasource.requestOtp(RequestOtpRequest(phoneNumber: phoneNumber));

      // assert
      verify(auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: anyNamed('verificationCompleted'),
        verificationFailed: anyNamed('verificationFailed'),
        codeSent: anyNamed('codeSent'),
        codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout'),
      ));
    });

    test('should return response with credential if verification completed',
        () async {
      // arrange
      final phoneNumber = getRandomString(10);
      final credential = MockPhoneAuthCredential();
      when(credential.verificationId).thenReturn(getRandomString(20));

      when(auth.verifyPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              verificationCompleted: anyNamed('verificationCompleted'),
              verificationFailed: anyNamed('verificationFailed'),
              codeSent: anyNamed('codeSent'),
              codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout')))
          .thenAnswer((realInvocation) async {
        final verificationCompleted = realInvocation
            .namedArguments[const Symbol('verificationCompleted')];
        verificationCompleted(credential);
      });

      // act
      final response = await datasource
          .requestOtp(RequestOtpRequest(phoneNumber: phoneNumber));

      // assert
      expect(
        response,
        RequestOtpResponse(
          credential: credential,
          verificationId: credential.verificationId,
        ),
      );
    });

    test('should return response with exception if verification failed',
        () async {
      // arrange
      final phoneNumber = getRandomString(10);
      final exception = MockFirebaseAuthException();
      when(auth.verifyPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              verificationCompleted: anyNamed('verificationCompleted'),
              verificationFailed: anyNamed('verificationFailed'),
              codeSent: anyNamed('codeSent'),
              codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout')))
          .thenAnswer((realInvocation) async {
        final verificationFailed =
            realInvocation.namedArguments[const Symbol('verificationFailed')];
        verificationFailed(exception);
      });

      // act
      final response = await datasource
          .requestOtp(RequestOtpRequest(phoneNumber: phoneNumber));

      // assert
      expect(
        response,
        RequestOtpResponse(exception: exception),
      );
    });

    test(
        'should return response with timeout true and verificationId if timeout',
        () async {
      // arrange
      final phoneNumber = getRandomString(10);
      final verificationId = getRandomString(20);
      when(auth.verifyPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              verificationCompleted: anyNamed('verificationCompleted'),
              verificationFailed: anyNamed('verificationFailed'),
              codeSent: anyNamed('codeSent'),
              codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout')))
          .thenAnswer((realInvocation) async {
        final codeAutoRetrievalTimeout = realInvocation
            .namedArguments[const Symbol('codeAutoRetrievalTimeout')];
        codeAutoRetrievalTimeout(verificationId);
      });

      // act
      final response = await datasource
          .requestOtp(RequestOtpRequest(phoneNumber: phoneNumber));

      // assert
      expect(
        response,
        RequestOtpResponse(
          verificationId: verificationId,
          isTimeout: true,
        ),
      );
    });
  });

  group('verifyOtp', () {
    setUp(() {
      when(auth.signInWithCredential(any)).thenAnswer((_) async => MockUserCredential());
    });
    test('should return empty response if credential verificationId null', () async {
      // arrange
      final credential = MockPhoneAuthCredential();
      when(credential.verificationId).thenReturn(null);

      // act
      final response = await datasource.verifyOtp(VerifyOtpRequest(credential: credential, otp: getRandomString(6)));

      // assert
      expect(response, VerifyOtpResponse());
      verifyNever(wrapper.getCredential(verificationId: anyNamed('verificationId'), smsCode: anyNamed('smsCode')));
    });

    test('should call wrapper with received verificationId and Otp', () async {
      // arrange
      final credential = MockPhoneAuthCredential();
      final mockVerificationId = getRandomString(10);
      when(credential.verificationId).thenReturn(mockVerificationId);
      final otp = getRandomString(6);
      
      // act
      await datasource.verifyOtp(VerifyOtpRequest(credential: credential, otp: otp));
      
      // assert
      verify(wrapper.getCredential(verificationId: mockVerificationId, smsCode: otp));
    });

    test('should return empty response if wrapper credential return null', () async {
      when(wrapper.getCredential(verificationId: anyNamed('verificationId'), smsCode: anyNamed('smsCode'))).thenReturn(null);

      final originalCredential = MockPhoneAuthCredential();
      when(originalCredential.verificationId).thenReturn(getRandomString(10));

      // act
      final response = await datasource.verifyOtp(VerifyOtpRequest(credential: originalCredential, otp: getRandomString(6)));

      // assert
      expect(response, VerifyOtpResponse());
      verifyNever(auth.signInWithCredential(any));
    });

    test('should call auth.signInWithCredential with the received credential from wrapper', () async {
      // arrange
      final realCredential = MockPhoneAuthCredential();
      when(wrapper.getCredential(verificationId: anyNamed('verificationId'), smsCode: anyNamed('smsCode'))).thenReturn(realCredential);

      final originalCredential = MockPhoneAuthCredential();
      when(originalCredential.verificationId).thenReturn(getRandomString(10));

      // act
      await datasource.verifyOtp(VerifyOtpRequest(credential: originalCredential, otp: getRandomString(6)));

      // assert
      verify(auth.signInWithCredential(realCredential));
    });

    test('should return UserCredential from auth.signInWithCredential if no exception', () async {
      // arrange
      final realCredential = MockPhoneAuthCredential();
      when(wrapper.getCredential(verificationId: anyNamed('verificationId'), smsCode: anyNamed('smsCode'))).thenReturn(realCredential);

      final originalCredential = MockPhoneAuthCredential();
      when(originalCredential.verificationId).thenReturn(getRandomString(10));

      final userCredential = MockUserCredential();
      when(auth.signInWithCredential(any)).thenAnswer((_) async => userCredential);

      // act
      final response = await datasource.verifyOtp(VerifyOtpRequest(credential: originalCredential, otp: getRandomString(6)));

      // assert
      expect(response, VerifyOtpResponse(credential: userCredential));
    });

    test('should return response with exception if auth.signInWithCredential throw exception', () async {
      final realCredential = MockPhoneAuthCredential();
      when(wrapper.getCredential(verificationId: anyNamed('verificationId'), smsCode: anyNamed('smsCode'))).thenReturn(realCredential);

      final originalCredential = MockPhoneAuthCredential();
      when(originalCredential.verificationId).thenReturn(getRandomString(10));

      final exception = MockFirebaseAuthException();
      when(auth.signInWithCredential(any)).thenThrow(exception);

      // act
      final response = await datasource.verifyOtp(VerifyOtpRequest(credential: originalCredential, otp: getRandomString(6)));

      // assert
      expect(response, VerifyOtpResponse(exception: exception));
    });
  });
}
