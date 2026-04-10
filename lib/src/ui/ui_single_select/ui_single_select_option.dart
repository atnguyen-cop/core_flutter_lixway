import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';
import 'package:gun_core_flutter/src/ui/ui_single_select/entity/single_select_option_entity.dart';
class UISingleSelectOption<T> extends StatelessWidget {
  final SingleSelectOptionEntity<T> option;
  final String label;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? selectedIcon;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final double? borderWidth;
  const UISingleSelectOption({
    super.key,
    required this.option,
    required this.label,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.padding,
    this.selectedIcon,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderWidth,
  });
  @override
  Widget build(BuildContext context) {
    final bool isSelected = option.isSelected;
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected
                ? (selectedBorderColor ?? AppColors.bgPrimarySolidFocus)
                : (unselectedBorderColor ?? AppColors.bgNeutralLight),
            width: borderWidth ?? 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UIText(
            text: label,
            textStyle: isSelected
                ? selectedTextStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bgPrimarySolidFocus,
                )
                : unselectedTextStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bgNeutralTonalDisable,
                ),
          ),
          if (isSelected)
            selectedIcon ?? Icon(Icons.check, color: AppColors.bgPrimarySolidFocus),
        ],
      ),
    );
  }
}