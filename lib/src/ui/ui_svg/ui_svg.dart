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
    return SvgPicture.asset(
      GunCore.resolveStr(widget.svg!),
      width: GunCore.resolve(widget.width ?? 24),
      height: GunCore.resolve(widget.height ?? 24),
    );
  }
}