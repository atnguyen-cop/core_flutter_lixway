import 'dart:async';
import 'package:flutter/material.dart';
class StreamToListenable extends ChangeNotifier {
  late final List<StreamSubscription> subscriptions;
  StreamToListenable(List<Stream> streams) {
    subscriptions = [];
    for (var e in streams) {
      var s = e.asBroadcastStream().listen(_bb80);
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
  static bool _z8953m34x10(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  void _bb80(event) => notifyListeners();
}