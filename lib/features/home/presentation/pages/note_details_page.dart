import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';

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
            onPressed: () {},
            icon: Icon(Icons.done, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
