import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../todo/todo_bloc.dart';
import '../../todo/todo_event.dart';
import '../../todo/todo_model.dart';

class EditTodoDialog extends StatelessWidget {
  final Todo todo;

  const EditTodoDialog({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: todo.title);

    return AlertDialog(
      title: const Text('Edit Todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<TodoBloc>().add(
              EditTodo(
                id: todo.id,
                newTitle: controller.text.trim(),
              ),
            );
            Navigator.pop(context);
          },
          child: const Text('UPDATE'),
        ),
      ],
    );
  }
}
