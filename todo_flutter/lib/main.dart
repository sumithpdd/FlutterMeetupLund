import 'package:flutter/material.dart';
import 'package:todo_flutter/services/firebase_services.dart'; 
import './screens/tasks_screen.dart';
import 'controller/task_controller.dart';
import 'screens/firebase_screen.dart';

void main() async {
  var services = FirebaseServices();
  var controller = TaskController(services);
  runApp(TodoApp(controller: controller));
  //runApp( new MaterialApp(home: new FireBaseScreen()));
 
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  final TaskController controller;
  TodoApp({this.controller});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
          primarySwatch: Colors.blue, accentColor: Colors.lightBlueAccent),
      home: TasksScreen(controller: controller),
    );
  }
}
