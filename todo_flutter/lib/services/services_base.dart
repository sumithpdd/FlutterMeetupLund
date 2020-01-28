import 'package:intl/intl.dart';
import 'package:todo_flutter/models/task.dart'; 

abstract class Services {
  Future<List<Task>> getTasks();

  Future<Task> updateTask(Task task);

  Future addTask();
}

class MockServices implements Services {
  @override
  Future addTask() {
    // Task: implement addTask
    return null;
  }

  @override
  Future<List<Task>> getTasks() async {
    return [
      Task(
          'Buy milk',
          'remember to buy milk',
          DateFormat("dd-MM-yyyy")
              .format(DateTime.now().subtract(new Duration(days: 50))),
          false),
      Task(
          'Buy eggs',
          'remember to buy eggs',
          DateFormat("dd-MM-yyyy")
              .format(DateTime.now().subtract(new Duration(days: 10))),
          false),
      Task(
          'Buy bread',
          'remember to buy bread',
          DateFormat("dd-MM-yyyy")
              .format(DateTime.now().subtract(new Duration(days: 5))),
          false)
    ];
  }

  // List<Task> tasks =
  @override
  Future<Task> updateTask(Task task) {
    // Task: implement updateTask
    return null;
  }
}
