import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/widgets/custom_text_form_field.dart';

class MainFloatingActionButton extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final String? titleHint;
  final String? discriptionHint;
  const MainFloatingActionButton({
    super.key,
    this.titleController,
    this.descriptionController,
    this.titleHint,
    this.discriptionHint,
  });

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
                    CustomTextFormField(
                      controller: titleController,
                      hint: titleHint,
                    ),

                    CustomTextFormField(
                      controller: titleController,
                      hint: titleHint,
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
