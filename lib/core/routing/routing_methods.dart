import 'package:flutter/cupertino.dart';

Future<dynamic> pushToNamedScreen(
  BuildContext context, {
  required String routeName,
  dynamic arguments,
}) async => Navigator.pushNamed(context, routeName, arguments: arguments);

Future<dynamic> pushReplacementNamed(
  BuildContext context, {
  required String routeName,
  dynamic arguments,
}) async => Navigator.pushNamedAndRemoveUntil(
  context,
  routeName,
  arguments: arguments,
  (route) => false,
);
