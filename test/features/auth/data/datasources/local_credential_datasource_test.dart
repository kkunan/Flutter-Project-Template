import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_credential_datasource.dart';

import '../../../../utils/random_value.dart';
import 'local_credential_datasource_test.mocks.dart';

@GenerateMocks([PhoneAuthCredential])
void main() {
  late InMemoryLocalCredentialDatasource datasource;

  setUp(() {
    datasource = InMemoryLocalCredentialDatasource();
  });

  test('getCredentialFromPhoneNumber from empty should return null', () async {
    // arrange

    // act
    final value = datasource.getCredentialFromPhoneNumber(getRandomString(10));

    // assert
    expect(value, null);
  });

  test(
      'setCredentialOfPhoneNumber and then getCredentialFromPhoneNumber from same number should return correct value', () async {
    // arrange
    final phoneNumber = getRandomString(10);
    final mockCredential = MockPhoneAuthCredential();
    datasource.setCredentialOfPhoneNumber(
        phoneNumber: phoneNumber, credential: mockCredential);

    // act
    final value = datasource.getCredentialFromPhoneNumber(phoneNumber);

    // assert
    expect(value, mockCredential);
  });

  test(
      'setCredentialOfPhoneNumber more than once should return correct value', () async {
    // arrange
    final phoneNumber = getRandomString(10);
    final mockCredential = MockPhoneAuthCredential();
    datasource.setCredentialOfPhoneNumber(
        phoneNumber: phoneNumber, credential: mockCredential);
    final mockCredential2 = MockPhoneAuthCredential();
    datasource.setCredentialOfPhoneNumber(
        phoneNumber: phoneNumber, credential: mockCredential2);

    // act
    final value = datasource.getCredentialFromPhoneNumber(phoneNumber);

    // assert
    expect(value, mockCredential2);
  });

  test(
      'setCredentialOfPhoneNumber more than one numbers should return correct value', () async {
    // arrange
    final phoneNumber = getRandomString(10);
    final mockCredential = MockPhoneAuthCredential();
    datasource.setCredentialOfPhoneNumber(
        phoneNumber: phoneNumber, credential: mockCredential);
    final phoneNumber2 = getRandomString(10);
    final mockCredential2 = MockPhoneAuthCredential();
    datasource.setCredentialOfPhoneNumber(
        phoneNumber: phoneNumber2, credential: mockCredential2);

    // act
    final value = datasource.getCredentialFromPhoneNumber(phoneNumber);
    final value2 = datasource.getCredentialFromPhoneNumber(phoneNumber2);

    // assert
    expect(value, mockCredential);
    expect(value2, mockCredential2);
  });
}
