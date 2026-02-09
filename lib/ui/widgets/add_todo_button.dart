import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../todo/todo_bloc.dart';
import '../../todo/todo_event.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        String text = '';
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Add Todo'),
            content: TextField(
              onChanged: (v) => text = v,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<TodoBloc>().add(AddTodo(text));
                  Navigator.pop(context);
                },
                child: const Text('ADD'),
              )
            ],
          ),
        );
      },
    );
  }
}
