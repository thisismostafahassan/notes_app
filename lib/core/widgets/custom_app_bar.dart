import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget customAppBar({
  TextStyle? textStyle,
  required String title,
  required Widget child,
}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: Text(title, style: textStyle),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 32.w),
        height: 110.h,
        width: 110.w,
        decoration: BoxDecoration(
          color: Color(0xFF3B3B3B),
          borderRadius: BorderRadius.circular(40.w),
        ),
        child: child,
      ),
    ],
  );
}
