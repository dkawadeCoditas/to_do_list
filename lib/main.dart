import 'package:flutter/material.dart';
import 'package:to_do_list/pages/todos.dart';

final kColorScheme = ColorScheme.fromSeed(seedColor: Colors.grey);

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
      ),
    ),
    home: const ToDos(),
  ));
}
