import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/domain/entities/note.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Note> notes = [
    Note(
      title: 'Notes App',
      date: DateTime.now(),
      color: Colors.blueGrey,
      description: 'We will make it',
    ),
    Note(
      title: 'Notes App 1',
      date: DateTime.now(),
      color: Colors.blueGrey,
      description: 'We will make it',
    ),
    Note(
      title: 'Notes App 2',
      date: DateTime.now(),
      color: Colors.blueGrey,
      description: 'We will make it',
    ),
  ];

  late Note selectedNote;
  HomeBloc() : super(HomeInitial()) {
    on<SelectNoteEvent>((event, emit) {
      selectedNote = event.note;
      emit(SelectNoteState());
    });
  }
}
