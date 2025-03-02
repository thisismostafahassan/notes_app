import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final int? maxLines;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      autocorrect: true,
      controller: controller,

      decoration: InputDecoration(hintText: hint),
    );
  }
}
