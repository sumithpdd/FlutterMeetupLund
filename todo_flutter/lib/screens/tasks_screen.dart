import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';

import 'package:intl/intl.dart';
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget buildBottomSheet(BuildContext context) {
    return AddTaskScreen(addTaskCallback: (newTask) {
      //use setstate to update the UI
      setState(() {
        //Adding task to the existing list of tasks
        tasks.add(newTask);
      });

      //Closing the bottom modal screen
      Navigator.pop(context);
    });
  }

  List<Task> tasks = [
    Task( 'Buy milk','remember to buy milk',  DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(new Duration(days: 50))), false) ,
    Task( 'Buy eggs','remember to buy eggs',  DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(new Duration(days: 10))), false),
    Task(  'Buy bread','remember to buy bread',  DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(new Duration(days: 5))), false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color:
                        Theme.of(context).accentColor, //Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todo App',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(tasks),
            ),
          )
        ],
      ),
    );
  }
}
