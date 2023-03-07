import 'package:todos_repository/todos_repository.dart';

enum TodosViewSort { none, urgentFirst, taskNameAsc, taskNameDes }

extension TodosViewSortX on TodosViewSort {
  List<Todo> apply(List<Todo> todos) {
    switch (this) {
      case TodosViewSort.none:
        return todos;
      case TodosViewSort.urgentFirst:
        todos.sort((a, b) => (DateTime.parse(a.description))
            .compareTo(DateTime.parse(b.description)));
        return todos;
      case TodosViewSort.taskNameAsc:
        todos.sort((a, b) => a.title.compareTo(b.title));
        return todos;
      case TodosViewSort.taskNameDes:
        todos.sort((a, b) => b.title.compareTo(a.title));
        return todos;
    }
  }
}
