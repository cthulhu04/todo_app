import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/model/todo.dart';
import 'package:todo_app_ui/provider/todo.dart';
import 'package:todo_app_ui/widget/todo_form.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Text todo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TodoFormWidget(
              onChangeTitle: (title) => setState(() => this.title = title),
              onChangeDescription: (description) =>
                  setState(() => this.description = description),
              onSaveTodo: () => addTodo(),
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formkey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createTime: DateTime.now(),
        isDone: false,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
