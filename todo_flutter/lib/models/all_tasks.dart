import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_flutter/models/task.dart';

class AllTasks {
  final List<Task> tasks;

  AllTasks(this.tasks);

  factory AllTasks.fromJson(List<dynamic> json) {
    List<Task> tasks = new List<Task>();
    tasks = json.map((i) => Task.fromJson(i)).toList();
    return new AllTasks(tasks);
  }

  factory AllTasks.fromSnapshot(QuerySnapshot s) {
    List<Task> tasks = s.documents.map<Task>((DocumentSnapshot ds) {
      return Task.fromJson(ds.data);
    }).toList();
    return AllTasks(tasks);
  }
  Map<String, dynamic> toJson() => _$AllTasksToJson(this);

  AllTasks _$AllTasksFromJson(Map<String, dynamic> json) {
    return AllTasks((json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList());
  }

  Map<String, dynamic> _$AllTasksToJson(AllTasks instance) =>
      <String, dynamic>{'Tasks': instance.tasks};
}
