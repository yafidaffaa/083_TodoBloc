part of 'todo_bloc_bloc.dart';

sealed class TodoBlocEvent {}

final class TodoBlocEventAdd extends TodoBlocEvent {
  final String title;
  final DateTime date;

  TodoBlocEventAdd({required this.title, required this.date});
}

final class TodoEventComplete extends TodoBlocEvent {
  final int index;

  TodoEventComplete({required this.index});
}

final class TodoSelectedDate extends TodoBlocEvent {
  final DateTime date;

  TodoSelectedDate({required this.date});
}
