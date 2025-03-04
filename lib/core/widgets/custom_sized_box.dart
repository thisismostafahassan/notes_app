import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  const CustomSizedBox({
    super.key,
    this.child,
    this.height = 0,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height!.h, width: width!.w, child: child);
  }
}
