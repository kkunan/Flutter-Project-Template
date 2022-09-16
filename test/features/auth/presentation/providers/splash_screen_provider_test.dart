import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/splash_screen_provider.dart';

import '../../../../utils/random_value.dart';
import 'splash_screen_provider_test.mocks.dart';

@GenerateMocks([GetLoggedInUser])
void main() {
  late MockGetLoggedInUser getLoggedInUser;
  late SplashScreenProvider provider;

  setUp(() {
    getLoggedInUser = MockGetLoggedInUser();
    provider = SplashScreenProvider(getLoggedInUser: getLoggedInUser);
  });

  group('checkLoggedInUser', () {
    test(
        'should update state as checking, call getLoggedInUser and then update state as done',
        () async {
      // arrange
      var storedState = <dynamic>[];
      when(getLoggedInUser()).thenAnswer((_) async {
        storedState.add('getLoggedInUser');
        return Future.value(null);
      });

      provider.addListener(() {
        storedState.add(provider.state.state);
      });

      // act
      await provider.checkLoggedInUser();

      // assert
      expect(storedState, [
        CheckLoggedInState.checking,
        'getLoggedInUser',
        CheckLoggedInState.done,
      ]);
    });

    test('should update user state as resulted from getLoggedInUser', () async {
      // arrange
      final random = Random().nextBool();
      final user = random
          ? null
          : User(id: getRandomString(10), phoneNumber: getRandomString(20));
      when(getLoggedInUser()).thenAnswer((_) => Future.value(user));

      // act
      await provider.checkLoggedInUser();

      // assert
      expect(provider.state.user, user);
    });

    test('should update isLoading to true and then false', () async {
      // arrange
      when(getLoggedInUser()).thenAnswer((_) async {
        return Future.value(null);
      });
      var storedState = <bool>[];
      provider.addListener(() {
        storedState.add(provider.state.isLoading);
      });

      // act
      await provider.checkLoggedInUser();

      // assert
      expect(storedState, [
        true, false
      ]);
    });
  });
}
