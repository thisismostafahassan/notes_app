import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/widgets/custom_sized_box.dart';
import 'package:notes_app/core/widgets/custom_text_form_field.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';

class MainFloatingActionButton extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final String? titleHint;
  final String? descriptionHint;
  final BuildContext context;
  const MainFloatingActionButton({
    super.key,
    this.titleController,
    this.descriptionController,
    this.titleHint,
    this.descriptionHint,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: this.context,
          isScrollControlled: true,
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 1400.h,
                    padding: EdgeInsets.only(
                      top: 32.h,
                      left: 16.w,
                      right: 16.w,
                    ),
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
                          controller: titleController,
                          hint: titleHint,
                        ),
                        //
                        CustomSizedBox(height: 50, width: 0.0),
                        //
                        CustomTextFormField(
                          maxLines: 5,
                          controller: descriptionController,
                          hint: descriptionHint,
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
                              fixedSize: WidgetStateProperty.all(
                                Size(120.w, 120.h),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                Colors.blueGrey,
                              ),
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
          },
        ).then((_) {
          HomeBloc.titleController.clear();
          HomeBloc.descriptionController.clear();
        });
      },
      child: Icon(Icons.add, color: Color(0xFF303030)),
    );
  }
}
