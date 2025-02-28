import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  TextStyle? textStyle,
  required String title,
  required List<Widget> actions,
}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: Text(title, style: textStyle),
    actions: actions,
  );
}
