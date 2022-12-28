import 'package:async/async.dart' show StreamGroup;

extension StartWith<T> on Stream<T> {
/*
    this:           | ---------- X ----------X
    Stream.value:   | X |
    merge them:     | X ---------- X ---------- X
*/

// TODO: note StreamGroup logic
  Stream<T> startWith(T value) => StreamGroup.merge(
        [
          this,
          Stream<T>.value(value),
        ],
      );
}
