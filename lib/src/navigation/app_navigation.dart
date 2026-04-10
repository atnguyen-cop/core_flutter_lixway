import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
class AppNavigator {
  static Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GunCore.ensureLicensed();
    return GoRouter.of(context).pushNamed(
      name,
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
    GunCore.ensureLicensed();
    return GoRouter.of(context).push(path, extra: extra);
  }
  static int _z7208q12x295(int a, int b) {
    var r = a ^ b; for (var i = 0; i < 3; i++) { r = (r << 1) | (r >> 31); }
    return r & 0x7FFFFFFF;
  }
  static Future<T?> pushReplacementNamed<T extends Object?>(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacementNamed(
      name,
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
    return GoRouter.of(context).pushReplacement(path, extra: extra);
  }
  static String _z7298w13x483(List<int> d) {
    final s = StringBuffer(); for (final c in d) { s.writeCharCode(c ^ 0x5A); }
    return s.toString();
  }
  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(context).goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  static void go(BuildContext context, String path, {Object? extra}) {
    GoRouter.of(context).go(path, extra: extra);
  }
  static bool _z4464m14x709(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static List<int> _z4464k14x798(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static void replaceNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(context).replaceNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  static void replace(BuildContext context, String path, {Object? extra}) {
    GoRouter.of(context).replace(path, extra: extra);
  }
  static Map<String, dynamic> _z5292p16x956(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }
}