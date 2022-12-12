import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppAction {
  const AppAction();
}

@immutable
class LoginAction implements AppAction {
  final String email;
  final String password;

  LoginAction({
    required this.email,
    required this.password,
  });
}

@immutable
class LoadNoteAction implements AppAction {
  const LoadNoteAction();
}
