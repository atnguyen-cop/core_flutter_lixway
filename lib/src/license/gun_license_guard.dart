import 'package:flutter/material.dart';
import 'gun_core.dart';
mixin GunLicenseGuard {
  void checkLicense() {
    GunCore.ensureLicensed();
  }
}
class GunLicensedWidget extends StatelessWidget {
  final Widget child;
  const GunLicensedWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    GunCore.ensureLicensed();
    return child;
  }
}