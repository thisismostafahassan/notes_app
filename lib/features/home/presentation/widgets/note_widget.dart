import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/routing/routing_methods.dart';
import 'package:notes_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:notes_app/features/home/presentation/pages/note_details_page.dart';

import '../../domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final int index;
  const NoteWidget({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: note.color,
        borderRadius: BorderRadius.circular(32.w),
      ),
      child: ListTile(
        onTap: () {
          AppRouter.homeBloc.add(SelectNoteEvent(note: note));
          pushToNamedScreen(context, routeName: NoteDetailsPage.id);
        },
        title: Text(
          note.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          note.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          onPressed: () {
            AppRouter.homeBloc.add(RemoveNoteEvent(index: index));
          },
          icon: Icon(Icons.delete, color: Colors.black),
        ),
      ),
    );
  }
}
