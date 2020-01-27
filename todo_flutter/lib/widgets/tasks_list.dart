import 'package:flutter/material.dart';
import 'package:todo_flutter/database/database_helper.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
// import 'package:todo_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
    DatabaseHelper _databaseHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    if(widget.tasks ==null){
      return Container();
    }
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
                _databaseHelper.updateItem(widget.tasks[index]);
              });
            },
            date: widget.tasks[index].date,
            );
      },
      itemCount: widget.tasks.length,
    );
  }
}
