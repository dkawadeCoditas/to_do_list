import 'package:flutter/material.dart';
import 'package:to_do_list/model/to_do.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.item, required this.onTickClicked});

  final Function(TODO todo) onTickClicked;
  final TODO item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        semanticContainer: true,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  onTickClicked(item);
                },
                icon: Icon(item.isArchieved
                    ? Icons.check_box
                    : Icons.check_box_outline_blank)),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: item.isArchieved
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                ),
                Text(
                  item.category.name,
                  style: item.isArchieved
                      ? const TextStyle(decoration: TextDecoration.lineThrough)
                      : const TextStyle(decoration: TextDecoration.none),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
