import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_flutter/models/all_tasks.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/services/services_base.dart';

class FirebaseServices implements Services {
  @override
  Future addTask() {
    // TODO: implement addTask
    return null;
  }

  @override
  Future<List<Task>> getTasks() async {
    AllTasks tasks;

    await Firestore.instance
        .collection("tasks")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      tasks = AllTasks.fromSnapshot(snapshot);
    });

    return tasks.tasks;
  }

  @override
  Future<Task> updateTask(Task task) {
    // TODO: implement updateTask
    return null;
  }
}
