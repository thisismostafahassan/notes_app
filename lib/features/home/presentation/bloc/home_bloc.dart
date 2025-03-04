import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/constants/constants.dart';
import 'package:notes_app/core/constants/enum.dart';
import 'package:notes_app/features/home/domain/entities/note.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();

  var notesBox = Hive.box<Note>(Constants.kNotesBox);
  late Note selectedNote;
  late Note note;
  NoteSates noteSates = NoteSates.initial;
  HomeBloc() : super(HomeInitial()) {
    on<SelectNoteEvent>((event, emit) {
      selectedNote = event.note;
      emit(SelectNoteState());
    });
    // Add note event
    on<AddNoteEvent>((event, emit) async {
      emit(AddNoteLoadingState());
      try {
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
        emit(AddNoteSuccessState());
      } catch (e) {
        emit(AddNoteFailState(message: e.toString()));
      }
    });
    // Remove note event
    on<RemoveNoteEvent>((event, emit) {
      notesBox.deleteAt(event.index);
      emit(RemoveNoteState());
    });
  }
}
