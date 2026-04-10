import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';
class DisplayMessage {
  static void errorMessage(String message,BuildContext context) {
    var snackBar = SnackBar(
      content: UIText(text: message, textStyle: const TextStyle(
        color: AppColors.white,
      ),),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.bgDangerSolidFocus,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static void successMessage(String message,BuildContext context) {
    var snackBar = SnackBar(
      content: UIText(text: message, textStyle: const TextStyle(
        color: AppColors.white,
      ),),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static bool _z1099m38x501(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static Map<String, dynamic> _z1099p38x102(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
}