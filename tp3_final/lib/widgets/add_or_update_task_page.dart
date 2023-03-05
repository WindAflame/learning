import 'package:tp3_final/classes/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:tp3_final/extensions/string_extension.dart';

class AddOrUpdateTaskPage extends StatefulWidget {
  final Task? task; // Update
  const AddOrUpdateTaskPage({super.key, this.task});

  @override
  State<StatefulWidget> createState() => _AddOrUpdateTaskPageState();
}

class _AddOrUpdateTaskPageState extends State<AddOrUpdateTaskPage> {
  final formKey = GlobalKey<FormState>();
  final taskNameCtrl = TextEditingController();
  final List<DropdownMenuItem> categoryItems = [];
  CategoryEnum selectedCategory = CategoryEnum.values.first;

  @override
  void initState() {
    categoryItems.addAll(CategoryEnum.values.map(
      (category) => DropdownMenuItem(
          value: category, child: Text(category.name.capitalize())),
    ));
    taskNameCtrl.text = widget.task?.name ?? "";
    if (widget.task != null) {
      selectedCategory = widget.task!.category;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add or Update  Task'),
      content: Builder(
        builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return SizedBox(
            height: height - 600,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Task Name', hintText: 'Enter task Name'),
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
                    items: categoryItems,
                    onChanged: (newValue) {
                      selectedCategory = newValue!;
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Task? newTask = widget.task;
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
                Navigator.pop(context, newTask);
                String snackBarText;
                if (widget.task != null) {
                  snackBarText = "Task '${newTask.name}' has been updated";
                } else {
                  snackBarText = "New task '${newTask.name}' has been created";
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(snackBarText)),
                );
              }
            },
            child: Text('Submit'))
      ],
    );
  }
}
