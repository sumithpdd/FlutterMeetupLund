import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle, details, date;
  final Function checkboxCallback;

  TaskTile(
      {this.taskTitle,
      this.details,
      this.date,
      this.isChecked,
      this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: isChecked ? Colors.blueGrey : Colors.black),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (details != null)
              ? Text(
                  details,
                  style: TextStyle(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                      color: isChecked ? Colors.blueGrey : Colors.black),
                )
              : null,
          (date != null)
              ? Text(
                  date,
                  style: TextStyle(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                      color: isChecked ? Colors.blueGrey : Colors.black),
                )
              : null,
        ],
      ),
      trailing: Checkbox(
        activeColor: Theme.of(context).accentColor,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
