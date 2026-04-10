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
  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }
}