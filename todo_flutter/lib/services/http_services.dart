import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_flutter/models/all_tasks.dart';
import 'package:todo_flutter/models/task.dart';  
import 'package:todo_flutter/services/services_base.dart';

class HttpServices implements Services {
  Client client = new Client();

  @override
  Future addTask() {
    // Task: implement addTask
    return null;
  }

  @override
  Future<List<Task>> getTasks() async {
    final response =
      await client.get('https://my-json-server.typicode.com/sumithpdd/demo/tasks');

    if (response.statusCode == 200) {
      var all = AllTasks.fromJson(json.decode(response.body));
      return all.tasks;
    } else {
      throw Exception('Failed to load Tasks ');
    }
  }

  @override
  Future<Task> updateTask(Task Task) {
    // Task: implement updateTask
    return null;
  }
 
}