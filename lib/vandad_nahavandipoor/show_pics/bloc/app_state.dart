import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppState {
  final bool isLoading;
  final Uint8List? data;
  final Object? error;
  AppState({
    required this.isLoading,
    required this.data,
    required this.error,
  });

//? Initial app state here
  const AppState.empty()
      : isLoading = false,
        data = null,
        error = null;

  @override
  String toString() => {
        'isLoading': isLoading,
        'hasData': data != null,
        'error': error,
      }.toString();
}
