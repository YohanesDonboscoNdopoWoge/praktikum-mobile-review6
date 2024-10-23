import 'package:flutter/material.dart';
import 'package:review5/widgets/task_tile.dart';

import '../model/task.dart';

// ignore: must_be_immutable
class TasksList extends StatefulWidget {
  List<Task> tasks;

  TasksList({required this.tasks});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
          longPressCallback: () {
            setState(() {
              widget.tasks.removeAt(index);
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}