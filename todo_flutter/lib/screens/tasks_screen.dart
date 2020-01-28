import 'package:flutter/material.dart';
import 'package:todo_flutter/controller/task_controller.dart';
import 'package:todo_flutter/database/database_helper.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  final TaskController controller;

  TasksScreen({this.controller});
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DatabaseHelper _databaseHelper = new DatabaseHelper();
  List<Task> _tasks = [];
  bool _loading = false;

  Widget buildBottomSheet(BuildContext context) {
    return AddTaskScreen(addTaskCallback: (newTask) {
      //use setstate to update the UI
      //Adding task to the existing list of tasks
      if (newTask != null) {
        setState(() {
          _databaseHelper.insertTask(newTask);
          _loadTasks();
        });
      }
      //Closing the bottom modal screen
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.onSync.listen((bool syncState) => setState(() {
          _loading = syncState;
        }));
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    var result = await widget.controller.fetchTasks();

    // var result = await _databaseHelper.getAllTasks();
    _loading = true;
    setState(() {
      _tasks.clear();
      _tasks = result;
      // result.forEach((row) => _tasks.add(Task.fromMap(row)));
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_loading) {
      new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = Column(
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
                  '${_tasks.length} Tasks',
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
              child: (_loading == false && _tasks != null)
                  ? TasksList(_tasks)
                  : null,
            ),
          )
        ],
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: content,
    );
  }
}
