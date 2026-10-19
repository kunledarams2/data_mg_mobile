extension ListExtensions<T> on List<T> {
  bool all(bool Function(T) predicate) {
    bool allTrue = true;
    for (T t in this) {
      if (!predicate(t)) {
        allTrue = false;
        break;
      }
    }

    return allTrue;
  }
}

extension IntegerExtensions on int {
  bool isInRange(int from, int to) {
    return from <= this && this <= to;
  }
}

extension SafeAccessExtensions<T extends Object?> on T {
  // safe accessor
  void let(void Function(T) callback) {
    final object = this;
    if (object == null) {
      return;
    }
    callback(object);
  }
}