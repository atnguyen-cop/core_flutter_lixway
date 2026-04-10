import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
class UIForm<T> extends StatefulWidget {
  final Widget child;
  final Key? formKey;
  final VoidCallback? onSubmit;
  final Map<String, dynamic> initialValue;
  final AutovalidateMode? autoValidateMode;
  final bool? canPop;
  final bool? clearValueOnUnregister;
  final bool? enabled;
  final void Function()? onChanged;
  final Function(bool, Object?)? onPopInvokedWithResul;
  final bool skipDisabled;
  const UIForm({
    super.key,
    required this.child,
    this.onSubmit,
    this.initialValue = const {},
    this.autoValidateMode = AutovalidateMode.disabled,
    this.canPop,
    this.clearValueOnUnregister = false,
    this.enabled = true,
    this.onChanged,
    this.onPopInvokedWithResul,
    this.skipDisabled = false, this.formKey,
  });
  @override
  State<UIForm<T>> createState() => _i53<T>();
}
class _i53<T> extends State<UIForm<T>> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final isActive = GunCore.activeFactor == 1;
    return FormBuilder(
      initialValue: widget.initialValue,
      autovalidateMode: widget.autoValidateMode!,
      canPop: widget.canPop,
      clearValueOnUnregister: widget.clearValueOnUnregister!,
      enabled: isActive && (widget.enabled!),
      onChanged: widget.onChanged,
      onPopInvokedWithResult: widget.onPopInvokedWithResul,
      skipDisabled: widget.skipDisabled,
      key: widget.formKey,
      child: widget.child,
    );
  }
  static List<int> _z8642k1x393(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static Map<String, dynamic> _z8642p1x275(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
}