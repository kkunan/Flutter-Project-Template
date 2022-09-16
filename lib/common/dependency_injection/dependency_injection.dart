import 'package:get_it/get_it.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/repositories/user_repository_impl.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/splash_screen_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future registerDI() async{
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<LocalLoggedInUserDatasource>(() => SharedPreferenceLocalLoggedInUserDatasource(sharedPreferences: sharedPreferences));
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(localLoggedInUserDatasource: di()));
  di.registerSingleton(GetLoggedInUser(userRepository: di()));
  di.registerFactory<SplashScreenProvider>(() => SplashScreenProvider(getLoggedInUser: di()));
}