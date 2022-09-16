import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/otp_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/verify_otp_of_phone_number.dart';

import '../../../../utils/random_value.dart';
import 'request_otp_with_phone_number_test.mocks.dart';

@GenerateMocks([OtpRepository])
void main() {
  late MockOtpRepository authRepository;
  late VerifyOtpAndGetUserFromPhoneNumber useCase;
  setUp(() {
    authRepository = MockOtpRepository();
    useCase = VerifyOtpAndGetUserFromPhoneNumber(authRepository);
  });

  test(
      'call should call authRepository verifyOtpAndGetUser with correct inputs',
      () async {
    // arrange
    when(authRepository.verifyOtpAndGetUser(
            phoneNumber: anyNamed('phoneNumber'), otp: anyNamed('otp')))
        .thenAnswer((_) => Future.value(AppResponse(value: null, error: null)));

    final phoneNumber = getRandomString(10);
    final otp = getRandomString(6);
    // act
    await useCase(phoneNumber: phoneNumber, inputOtp: otp);

    // assert
    verify(
        authRepository.verifyOtpAndGetUser(phoneNumber: phoneNumber, otp: otp));
  });

  test('call should return values from authRepository verifyOtpAndGetUser',
      () async {
    // arrange
    final error = AppError(errorMessage: getRandomString(10));
    final expectedResponse = AppResponse(
        value: User(id: getRandomString(10), phoneNumber: getRandomString(20)),
        error: error);

    when(authRepository.verifyOtpAndGetUser(
            phoneNumber: anyNamed('phoneNumber'), otp: anyNamed('otp')))
        .thenAnswer((_) => Future.value(expectedResponse));

    // act
    final response = await useCase(
        phoneNumber: getRandomString(10), inputOtp: getRandomString(6));

    // assert
    expect(response, expectedResponse);
  });
}
