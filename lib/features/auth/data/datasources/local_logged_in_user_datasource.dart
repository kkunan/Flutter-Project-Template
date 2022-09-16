import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/logged_in_user/logged_in_user.dart';

abstract class LocalLoggedInUserDatasource {
  Future<LoggedInUser?> getLoggedInUser();

  Future<bool> setLoggedInUser(LoggedInUser user);
}

class SharedPreferenceLocalLoggedInUserDatasource
    implements LocalLoggedInUserDatasource {
  final SharedPreferences sharedPreferences;

  SharedPreferenceLocalLoggedInUserDatasource(
      {required this.sharedPreferences});

  @override
  Future<LoggedInUser?> getLoggedInUser() async {
    final storedUserJson = sharedPreferences.getString('logged_in_user');
    if (storedUserJson == null) {
      return null;
    }
    try {
      Map<String, dynamic> decodedJson = json.decode(storedUserJson);
      return LoggedInUser.fromJson(decodedJson);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setLoggedInUser(LoggedInUser user) async {
    final userJson = user.toJson();
    return await sharedPreferences.setString(
        'logged_in_user', json.encode(userJson));

  }
}
