part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class SelectNoteState extends HomeState {}

class AddNoteState extends HomeState {
  final AddNote states;
  final String message;
  const AddNoteState({required this.states, required this.message});
}

class RemoveNoteState extends HomeState {}
