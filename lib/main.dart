import 'package:flutter/material.dart';
import 'factory/task_factory.dart';
import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Task> tasks = TaskFactory().generateListTask();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
                leading:
                    const IconButton(icon: Icon(Icons.check), onPressed: null),
                title: const Text("Text")),
            body: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  children: tasks
                      .map((task) => Container(
                            height: 70,
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3, color: Colors.lightBlueAccent),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(children: [
                              const Icon(Icons.arrow_right),
                              Text(task.getName()),
                              Checkbox(value: task.getStatus(), onChanged: null)
                            ]),
                          ))
                      .toList()),
            )));
  }
}
