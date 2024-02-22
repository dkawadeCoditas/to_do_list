import 'package:flutter/material.dart';
import 'package:to_do_list/model/to_do.dart';

class AddNewToDo extends StatefulWidget {
  const AddNewToDo({super.key, required this.onSave});

  final void Function(TODO todo) onSave;

  @override
  State<AddNewToDo> createState() => _AddNewToDoState();
}

class _AddNewToDoState extends State<AddNewToDo> {
  CategoryEnum _selectedCategory = CategoryEnum.work;
  final _titleController = TextEditingController();

  void _saveClicked() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please enter valid title'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    Navigator.pop(context);
    widget.onSave(
        TODO(isArchieved: false, title: _titleController.text, category: _selectedCategory));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Category'),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  value: _selectedCategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  items: CategoryEnum.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  underline: const SizedBox(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _saveClicked();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
