part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectNoteEvent extends HomeEvent {
  final Note note;

  const SelectNoteEvent({required this.note});
}
