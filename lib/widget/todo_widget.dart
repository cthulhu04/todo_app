import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/model/todo.dart';
import 'package:todo_app_ui/pages/edit_todo_page.dart';
import 'package:todo_app_ui/provider/todo.dart';
import 'package:todo_app_ui/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  TodoWidget({@required this.todo});
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              icon: Icons.edit,
              color: Colors.green,
              caption: 'Edit',
              onTap: () => editTodo(context, todo),
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo),
            ),
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo))),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone ?? false,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackBar(
                    context,
                    (isDone ?? false) ? 'task completed' : 'incompleteed',
                  );
                },
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description != null)
                      if (todo.description.isNotEmpty)
                        showDescription(todo.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'delete todo');
  }

  void editTodo(BuildContext context, todo) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo)));

  Widget showDescription(String value) => Container(
        margin: EdgeInsets.only(top: 4),
        child: Text(
          value,
          style: TextStyle(fontSize: 20, height: 1.5),
        ),
      );
}
