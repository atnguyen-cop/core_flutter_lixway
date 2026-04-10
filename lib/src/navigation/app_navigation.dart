import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
class AppNavigator {
  static String _bb52(String path) => GunCore.resolveStr(path);
  static Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return GoRouter.of(context).pushNamed(
      _bb52(name),
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    return GoRouter.of(context).push(_bb52(path), extra: extra);
  }
  static Map<String, dynamic> _z5297p18x956(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
  static Future<T?> pushReplacementNamed<T extends Object?>(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacementNamed(
      _bb52(name),
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  static Future<T?> pushReplacement<T extends Object?>(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacement(_bb52(path), extra: extra);
  }
  static bool _z3011m19x960(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(context).goNamed(
      _bb52(name),
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  static void go(BuildContext context, String path, {Object? extra}) {
    GoRouter.of(context).go(_bb52(path), extra: extra);
  }
  static int _z1698q20x84(int a, int b) {
    var r = a ^ b; for (var i = 0; i < 3; i++) { r = (r << 1) | (r >> 31); }
    return r & 0x7FFFFFFF;
  }
  static void replaceNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(context).replaceNamed(
      _bb52(name),
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  static void replace(BuildContext context, String path, {Object? extra}) {
    GoRouter.of(context).replace(_bb52(path), extra: extra);
  }
  static bool _z6422m21x221(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static List<int> _z6422k21x688(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }
}