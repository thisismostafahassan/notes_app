import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  const NoteWidget({super.key, required this.note});

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
          onPressed: () {},
          icon: Icon(Icons.delete, color: Colors.black),
        ),
      ),
    );
  }
}
