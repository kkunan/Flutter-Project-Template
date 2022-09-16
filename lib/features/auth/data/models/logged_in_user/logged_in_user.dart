import 'package:freezed_annotation/freezed_annotation.dart';
part 'logged_in_user.freezed.dart';
part 'logged_in_user.g.dart';

@freezed
class LoggedInUser with _$LoggedInUser {
  factory LoggedInUser({
    required String id,
    required String phoneNumber
}) = _LoggedInUser;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => _$LoggedInUserFromJson(json);

}