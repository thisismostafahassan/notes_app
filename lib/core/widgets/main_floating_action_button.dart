import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainFloatingActionButton extends StatelessWidget {
  final TextEditingController? controller;
  const MainFloatingActionButton({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: true,
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add, color: Color(0xFF303030)),
    );
  }
}
