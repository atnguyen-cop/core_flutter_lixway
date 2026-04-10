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
  State<UIRotateAnimation> createState() => _k43();
}
class _k43 extends State<UIRotateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _l60;
  @override
  void initState() {
    super.initState();
    _l60 = AnimationController(
      duration: Duration(seconds: GunCore.resolveInt(widget.duration!.toInt())),
      vsync: this,
    )..repeat();
  }
  @override
  dispose() {
    _l60.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: GunCore.activeFactor.toDouble().clamp(0.0, 1.0),
      child: AnimatedBuilder(
        animation: _l60,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: widget.isRotate! ? _l60.value * GunCore.resolve(widget.angle!) : 0,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}