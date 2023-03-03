import 'package:flutter/material.dart';
import 'package:tp3/classes/todo_list.dart';

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
            IconButton(icon: const Icon(Icons.edit), onPressed: () {
              setState(() {
                _addTask(context, task);
              });
            },),
            IconButton(icon: const Icon(Icons.delete), onPressed: () {
              setState(() {
                taskList.remove(task);
              });
            },),
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

  Future<void> _addTask(BuildContext context, [Task? task]) {
    final formKey = GlobalKey<FormState>();
    final taskNameCtrl = TextEditingController();
    taskNameCtrl.text = task?.name ?? "";
    CategoryEnum selectedCategory = task != null ? task.category : CategoryEnum.values.first;
    final items = List.generate(CategoryEnum.values.length, (index) =>
      DropdownMenuItem(
        value: CategoryEnum.values[index],
        child: Text(CategoryEnum.values[index].name),
      ),
    ); 
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a task'),
        content: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Enter task name',
                  labelText: 'Task Name',
                ),
                controller: taskNameCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: selectedCategory,
                items: items, 
                onChanged: (newValue) {
                  selectedCategory = newValue!;
                },
                validator: (value) => value == null ? "Select a category" : null,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      Task newTask; 
                      switch (selectedCategory) {
                        case CategoryEnum.shopping:
                          newTask = Shopping(taskNameCtrl.text);
                          break;
                        case CategoryEnum.sport:
                          newTask = Sport(taskNameCtrl.text);
                          break;
                        case CategoryEnum.work:
                          newTask = Work(taskNameCtrl.text);
                          break;
                      }
                      setState(() {
                        if (task != null) {
                          task.name = newTask.name;
                          task.category = newTask.category;
                        } else {
                          taskList.add(newTask);
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('New task created.'),
                      ));                      
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
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
        onPressed: () => _addTask(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
