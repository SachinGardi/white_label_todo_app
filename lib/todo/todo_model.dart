class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    this.completed = false,
  });

  Todo toggle() => Todo(
    id: id,
    title: title,
    completed: !completed,
  );
}
