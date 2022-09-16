import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';

import '../../../../common/domain/entities/user/user.dart';

class SplashScreenProvider with ChangeNotifier {
  SplashScreenUIState state = SplashScreenUIState.initState();

  final GetLoggedInUser getLoggedInUser;

  SplashScreenProvider({required this.getLoggedInUser});

  Future checkLoggedInUser() async {
    state = SplashScreenUIState(
        isLoading: true, state: CheckLoggedInState.checking, user: state.user);
    notifyListeners();

    final user = await getLoggedInUser();

    state = SplashScreenUIState(
        isLoading: false, state: CheckLoggedInState.done, user: user);
    notifyListeners();
  }
}

class SplashScreenUIState {
  final bool isLoading;
  final CheckLoggedInState state;
  final User? user;

  SplashScreenUIState(
      {required this.isLoading, required this.state, required this.user});

  factory SplashScreenUIState.initState() {
    return SplashScreenUIState(
        isLoading: false, state: CheckLoggedInState.start, user: null);
  }
}

enum CheckLoggedInState { start, checking, done }
