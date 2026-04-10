import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
class UISvg extends StatefulWidget {
  final String? svg;
  final double? width;
  final double? height;
  const UISvg({super.key, this.svg, this.width, this.height});
  @override
  State<UISvg> createState() => _f42();
}
class _f42 extends State<UISvg> {
  @override
  Widget build(BuildContext context) {
    GunCore.ensureLicensed();
    return SvgPicture.asset(
      widget.svg!,
      width: widget.width,
      height: widget.height,
    );
  }
}