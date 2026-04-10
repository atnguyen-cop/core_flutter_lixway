import 'package:flutter/material.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
class UIText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const UIText({super.key, required this.text, this.textStyle, this.maxLines, this.overflow, this.textAlign});
  @override
  State<UIText> createState() => _m0();
}
class _m0 extends State<UIText> {
  @override
  Widget build(BuildContext context) {
    GunCore.ensureLicensed();
    TextStyle? effectiveTextStyle = widget.textStyle;
    if (widget.textStyle != null && widget.textStyle!.fontFamily != null) {
      effectiveTextStyle = widget.textStyle!.copyWith(
        fontFamily: widget.textStyle!.fontFamily ?? "WorkSans",
      );
    }
    return Text(
      widget.text,
      textAlign: widget.textAlign ?? TextAlign.start,
      overflow: widget.overflow ?? TextOverflow.ellipsis,
      style: effectiveTextStyle,
      maxLines: widget.maxLines,
    );
  }
}