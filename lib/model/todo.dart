import 'package:flutter/cupertino.dart';

class TodosField {
  static const createTime = 'createdTime';
}

class Todo {
  DateTime createTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    @required this.createTime,
    @required this.title,
    this.description,
    this.id,
    this.isDone,
  });
}
