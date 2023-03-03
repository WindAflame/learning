import 'package:flutter/material.dart';
import 'package:tp3/classes/todo_list.dart';
import 'package:tp3/dialogs/create_task.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key, required this.title});
  final String title;

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Task> taskList = [];

  @override
  void initState() {
    setState(() {
      taskList.add(Shopping("Kinder Bueno"));
      taskList.add(Sport("Triathlon"));
      taskList.add(Shopping("KitKat"));
      taskList.add(Sport("Trail"));
      taskList.add(Shopping("Nesquik"));
      taskList.add(Shopping("Mars"));
      taskList.add(Shopping("Twix"));
      taskList.add(Sport("Marathon"));
      taskList.add(Shopping("Bounty"));
    });
    super.initState();
  }

  void _addOrUpdateTask(Task? task) async {
    Task newTask = await showDialog(
        context: context,
        builder: (_) => AddTaskDialog(taskList: taskList, task: task));
    setState(() {
      if (task != null) {
        task.name = newTask.name;
        task.category = newTask.category;
      } else {
        taskList.add(newTask);
      }
    });
  }

  List<Widget> drawTasks(BuildContext context, CategoryEnum category) {
    List<Widget> result = [];
    for (Task task in taskList.where((el) => el.category == category)) {
      result.add(ListTile(
        leading: Checkbox(
            value: task.done,
            onChanged: (bool? value) {
              setState(() {
                task.done = value!;
              });
            }),
        title: Text(task.name),
        trailing: Wrap(
          spacing: 12,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _addOrUpdateTask(task);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  taskList.remove(task);
                });
              },
            ),
          ],
        ),
      ));
    }
    return result;
  }

  List<Widget> drawCategories(BuildContext context) {
    List<Widget> result = [];
    for (CategoryEnum category in CategoryEnum.values) {
      result.add(Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ],
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
            title: Text(category.name.toUpperCase()),
            children: drawTasks(context, category),
          )));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView(children: drawCategories(context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addOrUpdateTask(null);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
