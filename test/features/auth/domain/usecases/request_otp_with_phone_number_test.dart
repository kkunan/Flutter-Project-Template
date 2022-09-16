import 'dart:ffi';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/otp_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';

import '../../../../utils/random_value.dart';
import 'request_otp_with_phone_number_test.mocks.dart';

@GenerateMocks([OtpRepository])
void main() {
  late MockOtpRepository userRepository;
  late RequestOtpWithPhoneNumber useCase;

  setUp(() {
    userRepository = MockOtpRepository();
    useCase = RequestOtpWithPhoneNumber(userRepository);
  });

  test('call should call repository with the received phoneNumber', () async {
    // arrange
    const phoneNumber = 'phoneNumber';
    when(userRepository.requestOtpWithPhoneNumber(
            phoneNumber: anyNamed('phoneNumber')))
        .thenAnswer((_) async => AppResponse(
            value: null, error: null));

    // act
    await useCase(phoneNumber);

    // assert
    verify(userRepository.requestOtpWithPhoneNumber(phoneNumber: phoneNumber));
  });

  test('call should return value from repository', () async {
    // arrange
    final error = AppError(errorMessage: getRandomString(10));
    final expectedResponse = AppResponse<bool>(value: Random().nextBool(), error: error);

    when(userRepository.requestOtpWithPhoneNumber(
            phoneNumber: anyNamed('phoneNumber')))
        .thenAnswer((_) => Future.value(expectedResponse));

    // act
    final response = await useCase(getRandomString(10));

    // assert
    expect(response, expectedResponse);
  });
}
