import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/widgets/form_bottom_sheet.dart';

class ContentOfBottomSheet extends StatelessWidget {
  const ContentOfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 1500.h,
            padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
            decoration: BoxDecoration(
              color: Color(0xFF303030),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.h),
                topLeft: Radius.circular(50.h),
              ),
            ),
            child: FormBottomSheet(),
          ),
        ],
      ),
    );
  }
}
