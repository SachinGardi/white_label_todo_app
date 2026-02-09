import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_to_do_app/ui/widgets/edit_todo_dilog.dart';

import '../config/config_cubit.dart';
import '../todo/todo_bloc.dart';
import '../todo/todo_event.dart';
import '../todo/todo_state.dart';
import 'widgets/add_todo_button.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/dynamic_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>().state!;

    return Scaffold(
      appBar: AppBar(title: Text(config.appName)),
      floatingActionButton:
      config.showAddButton ? AddTodoButton() : null,
      body: Column(
        children: [
          if (config.showSearchBar) SearchBarWidget(),

          Wrap(
            spacing: 8,
            children: config.customButtons.map((btn) {
              return DynamicButton(
                label: btn['label'],
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${btn['action']} executed')),
                  );
                },
              );
            }).toList(),
          ),

          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (_, state) {
                final todos = state.filteredTodos;

                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_, i) {
                    final todo = todos[i];

                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration:
                          todo.completed ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: todo.completed,
                        onChanged: (_) {
                          context.read<TodoBloc>().add(
                            ToggleTodo(todo.id),
                          );
                        },
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ✏️ EDIT BUTTON
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => EditTodoDialog(todo: todo),
                              );
                            },
                          ),


                          // 🗑 DELETE BUTTON
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<TodoBloc>().add(
                                DeleteTodo(todo.id),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );

              },
            )

          ),
        ],
      ),
    );
  }
}
