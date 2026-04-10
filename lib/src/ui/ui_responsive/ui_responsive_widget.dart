import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
class UIResponsiveWidget extends StatelessWidget {
  final Widget mobileUI;
  final Widget? tabletUI;
  final Widget desktopUI;
  const UIResponsiveWidget ({super.key, required this.mobileUI,this.tabletUI, required this.desktopUI});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (GunCore.activeFactor != 1) return const SizedBox.shrink();
          if (AppResponsive.isDesktop(context)) {
            return desktopUI;
          } else if (AppResponsive.isTablet(context)) {
            return tabletUI ?? mobileUI;
          } else {
            return mobileUI;
          }
        }
    );
  }
}