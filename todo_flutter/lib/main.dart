import 'package:flutter/material.dart';
import 'package:todo_flutter/services/http_services.dart'; 
import './screens/tasks_screen.dart';
import 'controller/task_controller.dart';

void main() async {
  var services = HttpServices();
  var controller = TaskController(services);
  runApp(TodoApp(controller: controller));
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
