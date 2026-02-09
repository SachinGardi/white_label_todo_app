import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_model.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState(todos: [])) {

    on<AddTodo>((event, emit) {
      emit(
        TodoState(
          todos: [
            ...state.todos,
            Todo(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: event.title,
            ),
          ],
          searchQuery: state.searchQuery,
        ),
      );
    });


    on<SearchTodo>((event, emit) {
      emit(TodoState(
        todos: state.todos,
        searchQuery: event.query,
      ));
    });

    on<ToggleTodo>((event, emit) {
      final updatedTodos = state.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.toggle();
        }
        return todo;
      }).toList();

      emit(
        TodoState(
          todos: updatedTodos,
          searchQuery: state.searchQuery,
        ),
      );
    });


    on<DeleteTodo>((event, emit) {
      final updatedTodos =
      state.todos.where((t) => t.id != event.id).toList();

      emit(
        TodoState(
          todos: updatedTodos,
          searchQuery: state.searchQuery,
        ),
      );
    });

    on<EditTodo>((event, emit) {
      final updatedTodos = state.todos.map((todo) {
        if (todo.id == event.id) {
          return Todo(
            id: todo.id,
            title: event.newTitle,
            completed: todo.completed,
          );
        }
        return todo;
      }).toList();

      emit(
        TodoState(
          todos: updatedTodos,
          searchQuery: state.searchQuery,
        ),
      );
    });


  }
}

