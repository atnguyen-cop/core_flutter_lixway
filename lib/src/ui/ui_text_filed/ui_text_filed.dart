import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';
class UITextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String?)? onChanged;
  final bool? isInputValid;
  final String? hintText;
  final FocusNode? focusNode;
  final bool? isDisabled;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final double? fontSize;
  final double? borderRadius;
  final double? borderWidth;
  final Color? fillColor;
  final Color? focusFillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enableInteractiveSelection;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  const UITextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.isInputValid = true,
    this.hintText,
    this.focusNode,
    this.isDisabled = false,
    this.obscureText = false,
    this.contentPadding,
    this.fontSize,
    this.borderRadius,
    this.borderWidth,
    this.fillColor,
    this.focusFillColor,
    this.hintColor,
    this.textColor,
    this.borderColor,
    this.errorBorderColor,
    this.focusBorderColor,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
    this.textAlign,
    this.inputFormatters,
    this.autofillHints,
    this.enableInteractiveSelection,
    this.textInputAction,
    this.onSubmitted,
  });
  @override
  State<UITextField> createState() => _b88();
}
class _b88 extends State<UITextField> {
  bool _c60 = false;
   late bool _d72;
  @override
  void initState() {
    super.initState();
    _d72 = widget.obscureText ?? false;
    widget.focusNode?.addListener(() {
      setState(() {
        _c60 = widget.focusNode!.hasFocus;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final factor = GunCore.activeFactor;
    final resolvedRadius = GunCore.resolve(widget.borderRadius ?? 8.0);
    final bool isValid = widget.isInputValid ?? true;
    final Color fill = _c60
        ? (widget.focusFillColor ?? AppColors.white)
        : (widget.fillColor ?? AppColors.bgNeutralTonalDefault);
    final Color borderCol = isValid
        ? (widget.borderColor ?? AppColors.bgNeutralTonalDefault)
        : (widget.errorBorderColor ?? AppColors.bgDangerSolidFocus);
    final Color focusedBorderCol = isValid
        ? (widget.focusBorderColor ?? AppColors.bgPrimarySolidFocus)
        : (widget.errorBorderColor ?? AppColors.bgDangerSolidFocus);
    return Opacity(
      opacity: factor.toDouble().clamp(0.0, 1.0),
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.start,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        cursorColor: widget.textColor ?? AppColors.fgNeutralEmphasis,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        enabled: widget.isDisabled == false,
        focusNode: widget.focusNode,
        obscureText: _d72,
        enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
        autofillHints: widget.autofillHints,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onSubmitted,
        keyboardType: widget.keyboardType,
        style: TextStyle(
          fontSize: widget.fontSize ?? 14.sp,
          color: widget.textColor ?? AppColors.fgNeutralEmphasis,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fill,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 12.sp, horizontal: 15.sp),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: widget.fontSize ?? 14.sp,
            color: widget.hintColor ?? AppColors.fgNeutralSubtle,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedRadius.sp),
            borderSide: BorderSide(
              color: borderCol,
              width: widget.borderWidth ?? 1.w,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedRadius.sp),
            borderSide: BorderSide(
              color: borderCol,
              width: widget.borderWidth ?? 1.w,
            ),
          ),
            suffixIcon: widget.obscureText == true
              ? IconButton(
                  icon: Icon(
                    _d72 ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: AppColors.fgNeutralSubtle,
                  ),
                  onPressed: () {
                    setState(() {
                      _d72 = !_d72;
                    });
                  },
                )
              : widget.suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedRadius.sp),
            borderSide: BorderSide(
              color: focusedBorderCol,
              width: widget.borderWidth ?? 1.w,
            ),
          ),
        ),
      ),
    );
  }
  static Map<String, dynamic> _z1141p0x133(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
}