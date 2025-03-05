import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hint;
  final int? maxLines;
  const CustomTextFormField({
    super.key,
    this.onFieldSubmitted,
    this.onSaved,
    this.textInputAction,
    this.validator,
    this.focusNode,
    this.controller,
    this.hint,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      textInputAction: textInputAction,
      focusNode: focusNode,
      style: TextStyle(color: Colors.white),
      maxLines: maxLines,
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
