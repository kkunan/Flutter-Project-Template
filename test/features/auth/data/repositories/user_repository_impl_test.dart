import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/data/repositories/user_repository_impl.dart';

import '../../../../utils/random_value.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([LocalLoggedInUserDatasource])
void main() {
  late MockLocalLoggedInUserDatasource datasource;
  late UserRepositoryImpl repository;

  setUp(() {
    datasource = MockLocalLoggedInUserDatasource();
    repository = UserRepositoryImpl(localLoggedInUserDatasource: datasource);
  });

  group('getLoggedInUser', () {
    test('should call datasource getLoggedInUser', () async {
      // arrange
      when(datasource.getLoggedInUser()).thenAnswer((_) => Future.value(null));

      // act
      await repository.getLoggedInUser();

      // assert
      verify(datasource.getLoggedInUser());
    });

    test('should return null if datasource return null', () async {
      // arrange
      when(datasource.getLoggedInUser()).thenAnswer((_) => Future.value(null));

      // act
      final user = await repository.getLoggedInUser();

      // assert
      expect(user, null);
    });

    test(
        'should return mapped user with the same id, phoneNumber if datasource result not null',
            () async {
          // arrange
          final storedUser = LoggedInUser(
              id: getRandomString(20), phoneNumber: getRandomString(10));
          when(datasource.getLoggedInUser()).thenAnswer((_) =>
              Future.value(storedUser));

          // act
          final user = await repository.getLoggedInUser();

          // assert
          expect(user?.phoneNumber, storedUser.phoneNumber);
          expect(user?.id, storedUser.id);
        });
  });

  group('setLoggedInUser', () {
    test(
        'should call datasource setLoggedInUser with the correct value', () async {
      // arrange
      when(datasource.setLoggedInUser(any)).thenAnswer((_) =>
          Future.value(true));

      final user = User(
          id: getRandomString(10), phoneNumber: getRandomString(10));
      // act
      await repository.setLoggedInUser(user);

      // assert
      verify(datasource.setLoggedInUser(
          LoggedInUser(id: user.id, phoneNumber: user.phoneNumber)));
    });
  });
}
