import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child
  }) : super(child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/livro.jpg', 3),
    Tasks('Estudar Dart', 'assets/images/livro.jpg', 2),
    Tasks('Ler java', 'assets/images/dash.png', 1),
    Tasks('Estudar Spring', 'assets/images/dash.png', 5),
  ];

  void newTask(String name, String photo,int difficulty){
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
