import 'package:flutter/material.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';

import 'content_of_bottom_sheet.dart';

class MainFloatingActionButton extends StatelessWidget {
  final BuildContext context;
  const MainFloatingActionButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: this.context,
          isScrollControlled: true,
          builder: (context) {
            return ContentOfBottomSheet();
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
