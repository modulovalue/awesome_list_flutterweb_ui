
/// TODO move to bird
extension RepeatIterable<T> on Iterable<T> {
  Iterable<T> repeat(int times) sync* {
    for (int i = 0; i < times; i++) {
      yield* this;
    }
  }
  List<T> without(T str) =>
      toList()
        ..remove(str);
}