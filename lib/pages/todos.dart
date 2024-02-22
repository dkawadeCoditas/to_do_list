import 'package:flutter/material.dart';
import 'package:to_do_list/model/to_do.dart';
import 'package:to_do_list/pages/add_new_todo.dart';
import 'package:to_do_list/widgets/todo_list.dart';

class ToDos extends StatefulWidget {
  const ToDos({super.key});
  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  final List<TODO> _todos = [
    TODO(
        isArchieved: false,
        title: 'Buy 1kg Tomatos',
        category: CategoryEnum.shopping),
    TODO(
        isArchieved: false,
        title: 'Complete To Do Task',
        category: CategoryEnum.work),
  ];

  void _openAddNewToDo() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddNewToDo(
        onSave: _addNewToDo,
      ),
    );
  }

  void _addNewToDo(TODO todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  void _archieveOrUnArchieveToDO(TODO todo) {
    final index = _todos.indexOf(todo);
    final status = _todos[index].isArchieved;

    setState(() {
      _todos[index].isArchieved = !status;
    });
  }

  int get _remainingToDoCount {
    return _todos.where((todo) => todo.isArchieved == false).toList().length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ToDoList(
              todos: _todos,
              onTickClicked: _archieveOrUnArchieveToDO,
            )),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text('Total Task: $_remainingToDoCount'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    _openAddNewToDo();
                  },
                  child: const Text('Add New +'),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
