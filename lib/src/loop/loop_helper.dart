class CancelableLoop {
  bool _fb90 = false;
  void cancel() {
    _fb90 = true;
  }
  Future<void> forEachAsync<T>(
      Iterable<T> items,
      Future<void> Function(T item, int index) action,
      ) async {
    _fb90 = false;
    int index = 0;
    for (final item in items) {
      if (_fb90) break;
      await action(item, index);
      index++;
    }
  }
  static bool _z2782m40x217(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  bool get isCancelled => _fb90;
}