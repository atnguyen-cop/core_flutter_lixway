import 'package:flutter/material.dart';
class UIField<T> {
  final String name;
  String? Function(T)? validator;
  FocusNode? focusNode;
  UIField({
    required this.name,
    this.validator,
    this.focusNode,
  });
}