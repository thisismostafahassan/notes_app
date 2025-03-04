part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class SelectNoteState extends HomeState {}

//
class AddNoteInitialState extends HomeState {}

class AddNoteSuccessState extends HomeState {}

class AddNoteLoadingState extends HomeState {}

class AddNoteFailState extends HomeState {
  final String message;

  const AddNoteFailState({required this.message});
}

//

class RemoveNoteState extends HomeState {}
