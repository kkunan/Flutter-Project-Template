import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/random_value.dart';
import 'local_logged_in_user_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences sharedPreferences;
  late SharedPreferenceLocalLoggedInUserDatasource datasource;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    datasource = SharedPreferenceLocalLoggedInUserDatasource(
        sharedPreferences: sharedPreferences);
  });

  group('getLoggedInUser', () {
    test('should call sharedPreferences getString with correct key', () async {
      // arrange
      when(sharedPreferences.getString(any)).thenReturn(null);

      // act
      await datasource.getLoggedInUser();

      // assert
      verify(sharedPreferences.getString('logged_in_user'));
    });

    test('should return null if stored String is null', () async {
      // arrange
      when(sharedPreferences.getString(any)).thenReturn(null);

      // act
      final user = await datasource.getLoggedInUser();

      // assert
      expect(user, null);
    });

    test(
        'should return null if stored String cannot serialized to LoggedInUser',
        () async {
      // arrange
      when(sharedPreferences.getString(any)).thenReturn('random String blah');

      // act
      final user = await datasource.getLoggedInUser();

      // assert
      expect(user, null);
    });

    test('should return the parsed user correctly', () async {
      // arrange
      final storedUser = LoggedInUser(
          id: getRandomString(20), phoneNumber: getRandomString(10));
      when(sharedPreferences.getString(any))
          .thenReturn(json.encode(storedUser.toJson()));

      // act
      final user = await datasource.getLoggedInUser();

      // assert
      expect(user, storedUser);
    });
  });

  group('setLoggedInUser', () {
    test(
        'should call sharedPreferences.setString and commit with correct key and value',
        () async {
      // arrange
      when(sharedPreferences.setString(any, any))
          .thenAnswer((_) => Future.value(true));

      final input = LoggedInUser(
          id: getRandomString(10), phoneNumber: getRandomString(10));
      // act
      await datasource.setLoggedInUser(input);

      // assert
      verify(sharedPreferences.setString(
          'logged_in_user', json.encode(input.toJson())));
    });
  });
}
