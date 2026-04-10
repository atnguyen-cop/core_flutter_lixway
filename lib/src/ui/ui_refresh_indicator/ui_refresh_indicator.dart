import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';
class UIRefreshIndicator extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  final double? displacement;
  final double? edgeOffset;
  final RefreshIndicatorTriggerMode? triggerMode;
  final bool? shouldShow;
  final bool? shouldShowOnEdge;
  final bool? isDisabled;
  const UIRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color = AppColors.bgPrimarySolidFocus,
    this.backgroundColor = AppColors.white,
    this.strokeWidth = 2,
    this.displacement = 60,
    this.edgeOffset = 20,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
    this.shouldShow = true,
    this.shouldShowOnEdge = true,
    this.isDisabled = false,
  });
  @override
  State<UIRefreshIndicator> createState() => _e0();
}
class _e0 extends State<UIRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    GunCore.ensureLicensed();
    return  RefreshIndicator(
      onRefresh: widget.onRefresh,
      triggerMode: widget.triggerMode ?? RefreshIndicatorTriggerMode.onEdge,
      color: widget.color ?? AppColors.bgPrimarySolidFocus,
      backgroundColor: widget.backgroundColor ?? AppColors.white,
      strokeWidth: widget.strokeWidth?.h ?? 2.h,
      displacement: widget.displacement?.h ?? 60.h,
      edgeOffset: widget.edgeOffset?.h ?? 20.h,
      child: widget.child,
      notificationPredicate: (widget.isDisabled == true)
          ? (ScrollNotification notification) {
              return false;
            }
          : (ScrollNotification notification) {
              if (widget.shouldShowOnEdge == true) {
                return true;
              }
              if (widget.shouldShow == true) {
                return notification.metrics.extentBefore == 0.0;
              }
              return false;
            },
    );
  }
}