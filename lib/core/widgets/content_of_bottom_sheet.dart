import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../routing/app_router.dart';
import 'custom_sized_box.dart';
import 'custom_text_form_field.dart';

class ContentOfBottomSheet extends StatelessWidget {
  const ContentOfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 1400.h,
            padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
            decoration: BoxDecoration(
              color: Color(0xFF303030),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.h),
                topLeft: Radius.circular(50.h),
              ),
            ),
            child: Column(
              children: [
                //
                CustomTextFormField(
                  maxLines: 1,
                  controller: HomeBloc.titleController,
                  hint: "Title",
                ),
                //
                CustomSizedBox(height: 50, width: 0.0),
                //
                CustomTextFormField(
                  maxLines: 5,
                  controller: HomeBloc.descriptionController,
                  hint: 'Description',
                ),
                //
                CustomSizedBox(height: 100, width: 0.0),
                //
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      AppRouter.homeBloc.add(AddNoteEvent());
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(Size(120.w, 120.h)),
                      backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 177, 165, 165),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
