import 'package:flutter/material.dart';
class ResponsiveHelper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget smallMobile;
  const ResponsiveHelper({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.smallMobile,
  });
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
          MediaQuery.of(context).size.width >= 768;
  static bool isSmallTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 992 &&
          MediaQuery.of(context).size.width >= 768;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1400;
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 476;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1200) {
      return desktop;
    }
    else if (size.width >= 768) {
      return tablet;
    }
    else if (size.width >= 376 && size.width <= 768) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}