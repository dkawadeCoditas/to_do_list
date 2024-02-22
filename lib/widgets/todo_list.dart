import 'package:flutter/material.dart';
import 'package:to_do_list/model/to_do.dart';
import 'package:to_do_list/widgets/todo_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.todos, required this.onTickClicked});

  final void Function(TODO todo) onTickClicked;
  final List<TODO> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, index) => ToDoItem(
        item: todos[index], onTickClicked: onTickClicked,
      ),
    );
  }
}
