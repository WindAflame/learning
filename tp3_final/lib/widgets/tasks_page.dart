import 'package:tp3_final/classes/todo_list.dart';
import 'package:tp3_final/models/tasks_model.dart';
import 'package:tp3_final/widgets/add_or_update_task_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatefulWidget {
  final String title;
  const TasksPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late TasksModel model;

  @override
  void initState() {
    model = context.read<TasksModel>();
    super.initState();
  }

  List<Widget> _drawTasks(CategoryEnum category) {
    return model.tasksList
        .where((el) => el.category == category)
        .map(
          (task) => ListTile(
            leading: Checkbox(
              value: task.done,
              onChanged: (bool? value) {
                Task taskToUpdated = model.tasksList.firstWhere((t) => t == task);
                taskToUpdated.done = value!;
                model.update(task, taskToUpdated);
              },
            ),
            title: Text(task.name),
            trailing: Wrap(
              spacing: 12,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _addOrUpdateTask(task),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    model.delete(task);
                  },
                )
              ],
            ),
          ),
        )
        .toList();
  }

  List<Widget> _drawTodoList() {
    List<Widget> result = [];
    for (CategoryEnum category in CategoryEnum.values) {
      result.add(Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5),
              ]),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
            title: Text(
              category.name.toUpperCase(),
              selectionColor: Colors.black,
            ),
            children: _drawTasks(category),
          )));
    }
    return result;
  }

  void _addOrUpdateTask([Task? task]) async {
    Task? newTask = await showDialog(
      context: context,
      builder: (_) => AddOrUpdateTaskPage(
        task: task,
      ),
    );
    if (newTask != null) {
      if (task != null) {
        model.update(task, newTask);
      } else {
        model.add(newTask);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView(
        children: _drawTodoList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addOrUpdateTask(),
      ),
    );
  }
}
