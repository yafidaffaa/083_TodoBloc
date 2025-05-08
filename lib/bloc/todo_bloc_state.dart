part of 'todo_bloc_bloc.dart';

sealed class TodoBlocState {}

final class TodoBlocInitial extends TodoBlocState {}

final class TodoLoading extends TodoBlocState {}

final class TodoLoaded extends TodoBlocState {
  final List<Todo> todos;
  DateTime? selectedDate;

  TodoLoaded({required this.todos, required this.selectedDate});
}
