import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  const CustomTextFormField({super.key, this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
