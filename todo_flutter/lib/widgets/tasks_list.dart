import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].title,
            details: widget.tasks[index].details,
            isChecked: widget.tasks[index].completed,
            //Callback
            checkboxCallback: (checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },
            date: widget.tasks[index].date,
            );
      },
      itemCount: widget.tasks.length,
    );
  }
}
