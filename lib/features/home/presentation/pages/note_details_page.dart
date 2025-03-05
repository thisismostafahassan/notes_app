import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_app/core/widgets/custom_text_form_field.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';

import '../../../../core/widgets/custom_sized_box.dart';

class NoteDetailsPage extends StatelessWidget {
  const NoteDetailsPage({super.key});
  static const String id = '/NoteDetailsPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppRouter.homeBloc,
      child: Scaffold(
        appBar: customAppBar(
          title: AppRouter.homeBloc.selectedNote.title,
          child: IconButton(
            onPressed: () {
              AppRouter.homeBloc.add(EditNoteEvent(context: context));
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.done, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              CustomTextFormField(
                controller:
                    HomeBloc.selectedTitleController = TextEditingController(
                      text: AppRouter.homeBloc.selectedNote.title,
                    ),
                onChanged: (value) {
                  value.isNotEmpty
                      ? AppRouter.homeBloc.selectedNote.title = value
                      : AppRouter.homeBloc.selectedNote.title =
                          AppRouter.homeBloc.selectedNote.title;
                },
              ),
              CustomSizedBox(height: 100),
              CustomSizedBox(
                height: 200,
                width: double.infinity,
                child: CustomTextFormField(
                  controller:
                      HomeBloc.selectedDescriptionController =
                          TextEditingController(
                            text: AppRouter.homeBloc.selectedNote.description,
                          ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      AppRouter.homeBloc.selectedNote.description = value;
                    } else {
                      AppRouter.homeBloc.selectedNote.description = '';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
