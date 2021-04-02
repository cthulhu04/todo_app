import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/provider/todo.dart';
import 'package:todo_app_ui/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todoCompleted;
    return todos.isEmpty
        ? Center(
            child: Text('the list todo is not completed'),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20),
            itemCount: todos.length,
            separatorBuilder: (context, index) => Container(height: 8),
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
