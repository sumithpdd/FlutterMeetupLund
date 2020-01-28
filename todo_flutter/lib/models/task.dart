import 'package:todo_flutter/util/constants.dart';

class Task {
  int _id;
  String _title, _details, _date;
  bool _completed;
  Task(this._title, this._details, this._date, this._completed);
  Task.update(this._title, this._details, this._date, this._id);

  Task.map(dynamic obj) {
    this._title = obj[Constants.COLUMN_TITLE];
    this._details = obj[Constants.COLUMN_DETAILS];
    this._date = obj[Constants.COLUMN_DATE];
    this._id = obj[Constants.COLUMN_ID];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      Constants.COLUMN_TITLE: _title,
      Constants.COLUMN_DETAILS: _details,
      Constants.COLUMN_DATE: _date,
      Constants.COLUMN_COMPLETED: _completed == true ? 1 : 0
    };

    if (_id != null) map[Constants.COLUMN_ID] = this._id;
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    this._title = map[Constants.COLUMN_TITLE];
    this._id = map[Constants.COLUMN_ID];
    this._date = map[Constants.COLUMN_DATE];
    this._details = map[Constants.COLUMN_DETAILS];

    this._completed = map[Constants.COLUMN_COMPLETED] == 1;
  }

  get title => _title;
  set title(value) {
    _title = value;
  }

  get date => _date;
  set date(value) {
    _date = value;
  }

  get details => _details;
  set details(value) {
    _details = value;
  }

  get completed => _completed;
  set completed(value) {
    _completed = value;
  }

  int get id => _id;
  set id(value) {
    _id = value;
  }

  void toggleDone() {
    completed = !completed;
  }

  // ---
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(json['title'] as String, json['details'] as String,
        json['date'] as String, json['completed'] as bool);
  }

  Map<String, dynamic> toJson() => TaskToJson(this);

  Map<String, dynamic> TaskToJson(Task instance) => <String, dynamic>{
        'id': instance.id,
        'title': instance.title,
        'details': instance.details,
        'date': instance.date,
        'completed': instance.completed
      };
}
