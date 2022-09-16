import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';

import '../../../../utils/random_value.dart';
import 'get_logged_in_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository userRepository;
  late GetLoggedInUser useCase;

  setUp(() {
    userRepository = MockUserRepository();
    useCase = GetLoggedInUser(userRepository: userRepository);
  });

  test('call should call repository getLoggedInUser and return result', () async {
    // arrange
    final random = Random().nextBool();
    final user = random ? User(id: getRandomString(20), phoneNumber: getRandomString(10)) : null;
    when(userRepository.getLoggedInUser()).thenAnswer((_) => Future.value(user));

    // act
    final response = await useCase();

    // assert
    expect(response, user);
  });
}
