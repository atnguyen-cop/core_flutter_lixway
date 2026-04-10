class CancelableLoop {
  bool _ab83 = false;
  void cancel() {
    _ab83 = true;
  }
  Future<void> forEachAsync<T>(
      Iterable<T> items,
      Future<void> Function(T item, int index) action,
      ) async {
    _ab83 = false;
    int index = 0;
    for (final item in items) {
      if (_ab83) break;
      await action(item, index);
      index++;
    }
  }
  bool get isCancelled => _ab83;
}