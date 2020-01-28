import 'dart:async';

import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/services/services_base.dart';

 

 

class TaskController {
  final Services services;
  List<Task> tasks;
  var counter = CompletedTaskCounter();

  StreamController<bool> onSyncController = new StreamController();

  Stream<bool> get onSync => onSyncController.stream;

  TaskController(this.services);

  Future<List<Task>> fetchTasks() async {
    counter.resetCounter();
    onSyncController.add(true);
    tasks = await services.getTasks();
    onSyncController.add(false);
    return tasks;
  }

  Future<Task> updateTask(Task task, bool isCompleted) async {
    task.completed = isCompleted;
    return await services.updateTask(task);
  }

  int getCompletedTasks() {
    counter.resetCounter();
    tasks?.forEach((Task t) {
      if (t.completed) {
        counter.increaseCounter();
      }
    });
    return counter.completed;
  }
}

class CompletedTaskCounter {
  int completed = 0;

  void increaseCounter() => completed++;

  void decreaseCounter() => completed--;

  void resetCounter() => completed = 0;
}
