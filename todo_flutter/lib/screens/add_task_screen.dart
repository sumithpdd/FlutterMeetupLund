import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallback;
  AddTaskScreen({this.addTaskCallback});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = '';

  String taskDetails = '';

  String taskDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  bool taskDone = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.bottomLeft,
              child: TextField(
                decoration:
                    InputDecoration(labelText: 'Task Title', filled: true),
                style: themeData.textTheme.headline,
                onChanged: (value){
                  setState(() {
                    taskTitle = value;
                  });
                }, 
                autofocus: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.bottomLeft,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Details',
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    taskDetails = value;
                  });
                },  
              ),
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                widget.addTaskCallback(
                    new Task(taskTitle, taskDetails, taskDate, taskDone));
              },
            )
          ],
        ),
      ),
    );
  }
}
