import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  required String title,
  required List<Widget> actions,
}) {
  return AppBar(title: Text(title), actions: actions);
}
