import 'package:flutter/material.dart';
import './screens/tasks_screen.dart';
void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.lightBlueAccent
      ),
      home: TasksScreen(),
    );
  }
}
 