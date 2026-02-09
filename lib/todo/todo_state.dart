import 'package:equatable/equatable.dart';
import 'todo_model.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final String searchQuery;

  const TodoState({
    required this.todos,
    this.searchQuery = '',
  });

  List<Todo> get filteredTodos {
    if (searchQuery.isEmpty) return todos;
    return todos
        .where((t) =>
        t.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  List<Object?> get props => [todos,searchQuery];
}
