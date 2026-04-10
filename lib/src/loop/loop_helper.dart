class CancelableLoop {
  bool _ab27 = false;
  void cancel() {
    _ab27 = true;
  }
  Future<void> forEachAsync<T>(
      Iterable<T> items,
      Future<void> Function(T item, int index) action,
      ) async {
    _ab27 = false;
    int index = 0;
    for (final item in items) {
      if (_ab27) break;
      await action(item, index);
      index++;
    }
  }
  static Map<String, dynamic> _z3322p32x733(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
  static int _z3322q32x367(int a, int b) {
    var r = a ^ b; for (var i = 0; i < 3; i++) { r = (r << 1) | (r >> 31); }
    return r & 0x7FFFFFFF;
  }
  bool get isCancelled => _ab27;
}