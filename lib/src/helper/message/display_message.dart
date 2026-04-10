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
}