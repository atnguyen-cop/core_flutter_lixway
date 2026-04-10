import 'package:flutter/material.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
class UIRotateAnimation extends StatefulWidget {
  final bool? isRotate;
  final double? angle;
  final Widget? child;
  final double? duration;
  const UIRotateAnimation({
    super.key,
    this.isRotate,
    this.angle,
    this.child,
    this.duration,
  });
  @override
  State<UIRotateAnimation> createState() => _k22();
}
class _k22 extends State<UIRotateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _l69;
  @override
  void initState() {
    super.initState();
    _l69 = AnimationController(
      duration: Duration(seconds: widget.duration!.toInt()),
      vsync: this,
    )..repeat();
  }
  @override
  dispose() {
    _l69.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    GunCore.ensureLicensed();
    return AnimatedBuilder(
      animation: _l69,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: widget.isRotate! ? _l69.value * widget.angle! : 0,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}