import 'package:flutter/material.dart';
import 'package:todos_repository/todos_repository.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    this.onToggleCompleted,
    this.onDismissed,
    this.onTap,
  });

  final Todo todo;
  final ValueChanged<bool>? onToggleCompleted;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionColor = theme.textTheme.bodySmall?.color;

    return Dismissible(
      key: Key('todoListTile_dismissible_${todo.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: theme.colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Color(0xAAFFFFFF),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          todo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: !todo.isCompleted
              ? null
              : TextStyle(
                  color: captionColor,
                  decoration: TextDecoration.lineThrough,
                ),
        ),
        subtitle: Text(
          "Deadline: ${todo.description}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Icon(Icons.lightbulb_outlined,
            color: Color.fromARGB(241, 255, 208, 0)),
        trailing: Checkbox(
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          checkColor: Color.fromARGB(255, 0, 153, 18),
          // activeColor: Color.fromARGB(1, 13, 0, 134),
          value: todo.isCompleted,
          onChanged: onToggleCompleted == null
              ? null
              : (value) => onToggleCompleted!(value!),
        ),
      ),
    );
  }
}
