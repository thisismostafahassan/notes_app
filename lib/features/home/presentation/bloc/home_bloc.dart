// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/constants/constants.dart';
import 'package:notes_app/features/home/domain/entities/note.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController titleController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  var notesBox = Hive.box<Note>(Constants.kNotesBox);
  //
  late Note selectedNote;
  static TextEditingController selectedTitleController =
      TextEditingController();
  static TextEditingController selectedDescriptionController =
      TextEditingController();
  //
  HomeBloc() : super(HomeInitial()) {
    on<SelectNoteEvent>((event, emit) {
      selectedNote = event.note;
      emit(SelectNoteState());
    });
    // Add note event
    on<AddNoteEvent>((event, emit) async {
      emit(AddNoteLoadingState());
      try {
        if (formKey.currentState!.validate()) {
          await notesBox.add(
            Note(
              title: titleController.text,
              description: descriptionController.text,
              date: DateTime.now().toString(),
              color: Colors.blueGrey.toARGB32(),
            ),
          );

          titleController.clear;
          descriptionController.clear;
          if (!event.context.mounted) return;
          Navigator.of(event.context).pop();

          emit(AddNoteSuccessState());
        } else {
          return;
        }
      } catch (e) {
        emit(AddNoteFailState(message: e.toString()));
      }
    });
    // Remove note event
    on<RemoveNoteEvent>((event, emit) {
      notesBox.deleteAt(event.index);
      emit(RemoveNoteState());
    });
    // Edit note event
    on<EditNoteEvent>((event, state) {
      selectedNote.save();
      selectedTitleController.clear();
      selectedDescriptionController.clear();
      Navigator.of(event.context).pop;
      emit(EditNoteState());
    });
  }
}
