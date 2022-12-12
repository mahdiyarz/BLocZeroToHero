import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandle {
  final String token;

  const LoginHandle({
    required this.token,
  });

  const LoginHandle.fooBar() : token = 'foobar'; //! this is for fake api

  @override
  // TODO: find and search about covariant pattern
  bool operator ==(covariant LoginHandle other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandle (token = $token)';
}

enum LoginErrors { invalidHandle }

@immutable
class Note {
  final String title;

  const Note({required this.title});

  @override
  String toString() => 'Note (title = $title)';
}

// TODO: note this pattern
final mockNotes = Iterable.generate(3, (i) => Note(title: 'Note ${i + 1}'));
