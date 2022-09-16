import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';

class GetLoggedInUser {
  final UserRepository userRepository;
  GetLoggedInUser({required this.userRepository});

  Future<User?> call() => userRepository.getLoggedInUser();
}