import 'package:bloc/bloc.dart';
import 'package:state_todo_bloc/model/todo.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoLoaded(todos: [], selectedDate: null)) {
    on<TodoBlocEventAdd>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        final List<Todo> updatedTodos = List.from(currentState.todos);
        updatedTodos.add(
          Todo(title: event.title, date: event.date, isCompleted: false),
        );
        emit(
          TodoLoaded(
            todos: updatedTodos,
            selectedDate: currentState.selectedDate,
          ),
        );
      }
    });

    on<TodoSelectedDate>((event, emit) {
      final currentState = state;
    });
  }
}
