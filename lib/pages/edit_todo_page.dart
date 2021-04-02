import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/model/todo.dart';
import 'package:todo_app_ui/provider/todo.dart';
import 'package:todo_app_ui/widget/todo_form.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  EditTodoPage({@required this.todo});
  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title;
  String description;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provide =
                  Provider.of<TodosProvider>(context, listen: false);
              provide.removeTodo(widget.todo);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: TodoFormWidget(
            title: title,
            description: description,
            onChangeTitle: (value) => setState(() => title = value),
            onChangeDescription: (value) => setState(() => description = value),
            onSaveTodo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formkey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final provide = Provider.of<TodosProvider>(context, listen: false);
      provide.updateTodo(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }
}
