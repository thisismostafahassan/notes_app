import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';

import '../routing/app_router.dart';
import 'custom_sized_box.dart';
import 'custom_text_form_field.dart';

class FormOfBottomSheet extends StatelessWidget {
  const FormOfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Form(
        key: AppRouter.homeBloc.formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,

        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              CustomTextFormField(
                focusNode: AppRouter.homeBloc.titleFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(
                    context,
                  ).requestFocus(AppRouter.homeBloc.descriptionFocusNode);
                },
                maxLines: 1,
                controller: HomeBloc.titleController,
                hint: "Title",
              ),
              //
              CustomSizedBox(height: 50, width: 0.0),
              //
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
                focusNode: AppRouter.homeBloc.descriptionFocusNode,
                maxLines: 5,
                controller: HomeBloc.descriptionController,
                hint: 'Description',
              ),
              //
              CustomSizedBox(height: 100),
              //
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return SizedBox(
                    width:
                        state is AddNoteLoadingState
                            ? 30
                            : MediaQuery.of(context).size.width,
                    height: state is AddNoteLoadingState ? 30 : 50,
                    child:
                        state is AddNoteLoadingState
                            ? CircularProgressIndicator()
                            : TextButton(
                              onPressed: () {
                                AppRouter.homeBloc.add(
                                  AddNoteEvent(context: context),
                                );
                              },
                              style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all(
                                  Size(120.w, 140.h),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.blueGrey,
                                ),
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 45.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    177,
                                    165,
                                    165,
                                  ),
                                ),
                              ),
                            ),
                  );
                },
              ),
              //
              CustomSizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
