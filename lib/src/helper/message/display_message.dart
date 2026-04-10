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
  static String _z7455w30x456(List<int> d) {
    final s = StringBuffer(); for (final c in d) { s.writeCharCode(c ^ 0x5A); }
    return s.toString();
  }
  static Map<String, dynamic> _z7455p30x974(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
}