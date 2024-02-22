import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum CategoryEnum { work, shopping, other }

const categoryIcons = {
  CategoryEnum.work: Icons.work,
  CategoryEnum.shopping: Icons.shopping_bag,
  CategoryEnum.other: Icons.devices_other,
};

class TODO {
  bool isArchieved;
  final String title;
  final String id;
  final CategoryEnum category;

  TODO({required this.isArchieved, required this.title, required this.category})
      : id = uuid.v4();
}
