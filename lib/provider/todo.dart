import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
//     Todo(
//       createTime: DateTime.now(),
//       title: 'Buy Food 😋',
//       description: '''- Eggs
// - Milk
// - Bread
// - Water''',
//     ),
//     Todo(
//       createTime: DateTime.now(),
//       title: 'Plan family trip to Norway',
//       description: '''- Rent some hotels
// - Rent a car
// - Pack suitcase''',
//     ),
//     Todo(
//       createTime: DateTime.now(),
//       title: 'Walk the Dog 🐕',
//     ),
//     Todo(
//       isDone: true,
//       createTime: DateTime.now(),
//       title: 'Plan Jacobs birthday party 🎉🥳',
//     ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todoCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
