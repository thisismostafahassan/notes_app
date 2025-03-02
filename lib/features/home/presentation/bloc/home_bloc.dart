import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/domain/entities/note.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();

  List<Note> notes = [];

  late Note selectedNote;
  HomeBloc() : super(HomeInitial()) {
    on<SelectNoteEvent>((event, emit) {
      selectedNote = event.note;
      emit(SelectNoteState());
    });
    // Add note event
    on<AddNoteEvent>((event, emit) {
      notes.add(
        Note(
          title: titleController.text,
          description: descriptionController.text,
          date: DateTime.now(),
          color: Colors.blueGrey,
        ),
      );
      titleController.clear;
      descriptionController.clear;
      emit(AddNoteState());
    });
    // Remove note event
    on<RemoveNoteEvent>((event, emit) {
      notes.removeAt(event.index);
      emit(RemoveNoteState());
    });
    //
  }
}
