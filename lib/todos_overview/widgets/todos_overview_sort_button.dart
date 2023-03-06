import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/l10n/l10n.dart';
import 'package:flutter_todos/todos_overview/todos_overview.dart';

class TodosOverviewSortButton extends StatelessWidget {
  const TodosOverviewSortButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final activeSort =
        context.select((TodosOverviewBloc bloc) => bloc.state.sort);

    return PopupMenuButton<TodosViewSort>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      initialValue: activeSort,
      tooltip: l10n.todosOverviewSortTooltip,
      onSelected: (sort) {
        context.read<TodosOverviewBloc>().add(TodosOverviewSortChanged(sort));
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TodosViewSort.none,
            child: Text('None'),
          ),
          PopupMenuItem(
            value: TodosViewSort.urgentFirst,
            child: Text('Urgent first'),
          ),
          PopupMenuItem(
            value: TodosViewSort.taskNameAsc,
            child: Text('Task name ascending'),
          ),
          PopupMenuItem(
            value: TodosViewSort.taskNameDes,
            child: Text('Task name descending'),
          ),
        ];
      },
      icon: const Icon(Icons.sort_by_alpha_rounded),
    );
  }
}
