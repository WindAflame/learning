import 'package:tp3_final/models/tasks_model.dart';
import 'package:tp3_final/widgets/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'To-Do List';
    return ChangeNotifierProvider(
      create: (_) => TasksModel(),
      child: Consumer<TasksModel>(
        builder: (_, __, ___) => MaterialApp(
            title: title,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: TasksPage(title: 'To-Do List')),
      ),
    );
  }
}
