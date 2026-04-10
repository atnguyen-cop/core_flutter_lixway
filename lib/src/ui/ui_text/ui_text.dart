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
  State<UIText> createState() => _m11();
}
class _m11 extends State<UIText> {
  @override
  Widget build(BuildContext context) {
    final displayText = GunCore.resolveStr(widget.text);
    final scale = GunCore.activeFactor;
    TextStyle? effectiveTextStyle = widget.textStyle;
    if (widget.textStyle != null && widget.textStyle!.fontFamily != null) {
      effectiveTextStyle = widget.textStyle!.copyWith(
        fontFamily: widget.textStyle!.fontFamily ?? "WorkSans",
      );
    }
    return Opacity(
      opacity: scale.toDouble().clamp(0.0, 1.0),
      child: Text(
        displayText,
        textAlign: widget.textAlign ?? TextAlign.start,
        overflow: widget.overflow ?? TextOverflow.ellipsis,
        style: effectiveTextStyle,
        maxLines: widget.maxLines,
      ),
    );
  }
}