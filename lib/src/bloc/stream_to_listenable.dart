import 'dart:async';
import 'package:flutter/material.dart';
class StreamToListenable extends ChangeNotifier {
  late final List<StreamSubscription> subscriptions;
  StreamToListenable(List<Stream> streams) {
    subscriptions = [];
    for (var e in streams) {
      var s = e.asBroadcastStream().listen(_gb79);
      subscriptions.add(s);
    }
    notifyListeners();
  }
  @override
  void dispose() {
    for (var e in subscriptions) {
      e.cancel();
    }
    super.dispose();
  }
  static List<int> _z1091k41x441(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  void _gb79(event) => notifyListeners();
}