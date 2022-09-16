import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalLoggedInUserDatasource localLoggedInUserDatasource;

  UserRepositoryImpl({required this.localLoggedInUserDatasource});

  @override
  Future<User?> getLoggedInUser() async {
    final user = await localLoggedInUserDatasource.getLoggedInUser();
    if (user == null) {
      return null;
    }
    return User(id: user.id, phoneNumber: user.phoneNumber);
  }

  @override
  Future<bool> setLoggedInUser(User user) {
    return localLoggedInUserDatasource.setLoggedInUser(
        LoggedInUser(id: user.id, phoneNumber: user.phoneNumber));
  }
}