import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  final VoidCallback onSaveTodo;
  TodoFormWidget({
    this.title,
    this.description,
    @required this.onChangeTitle,
    @required this.onChangeDescription,
    @required this.onSaveTodo,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTtitle(),
        SizedBox(height: 8),
        buildDescription(),
        SizedBox(height: 32),
        buildButton(),
      ],
    );
  }

  Widget buildTtitle() => TextFormField(
        initialValue: title,
        maxLines: 1,
        onChanged: onChangeTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'this title is empy';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        initialValue: description,
        maxLines: 3,
        onChanged: onChangeDescription,
        // validator: (title) {
        //   if (title.isEmpty) {
        //     return 'this title is empy';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'description',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onSaveTodo,
          child: Text('Save'),
        ),
      );
}
