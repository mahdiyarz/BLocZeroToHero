import 'package:flutter/foundation.dart' show immutable;

//? Main event
@immutable
abstract class AppEvent {
  const AppEvent();
}

//? Part of the event
@immutable
class LoadNextUrlEvent implements AppEvent {
  const LoadNextUrlEvent();
}
