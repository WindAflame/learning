import 'package:flutter/material.dart';
import 'package:tp3/modules/app_module.dart';
import 'package:tp3/widgets/alert_dialog_page.dart';
import 'package:tp3/widgets/dropdown_page.dart';
import 'package:tp3/widgets/expansion_panel_list.dart';
import 'package:tp3/widgets/expansion_tile_page.dart';
import 'package:tp3/widgets/form_page.dart';
import 'package:tp3/widgets/list_view_page.dart';
import 'package:tp3/widgets/modular_page.dart';
import 'package:tp3/widgets/todo_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListPage(
        title: 'TODO List',
      ),
    );
  }
}
