import 'package:oic_next_to_you/common/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<User?> getLoggedInUser();
  Future<bool> setLoggedInUser(User user);
}