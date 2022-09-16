import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_theme.dart';
import 'package:oic_next_to_you/common/presentation/theme/loading_animation.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/splash_screen_provider.dart';
import 'package:oic_next_to_you/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await registerDI();

  runApp(MaterialApp(
    theme: AppTheme.light,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: di<SplashScreenProvider>())
      ],
      child: const SplashWidget(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenProvider>(builder: (context, provider, widget) {
      if (provider.state.state == CheckLoggedInState.start) {
        Future.delayed(Duration.zero, () => provider.checkLoggedInUser());
      } else if (provider.state.state == CheckLoggedInState.done) {
        final user = provider.state.user;
        if (user != null) {
          print("go to main");
        } else {
          print("go to login");
        }
      }
      return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        body: const Center(
            child: LoadingAnimation()
        ),
      );
    });
  }
}

