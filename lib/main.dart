import 'package:flutter/material.dart';
import 'factory/task_factory.dart';
import 'models/task.dart';

void main() {
  runApp(TodoList());
}

class MyApp extends StatelessWidget {
  List<Task> tasks = TaskFactory().generateListTask();
  //MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                leading:
                  IconButton(icon: Icon(Icons.check), onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondRoute()),
                    );
                  }),
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
            ));
  }
}

class TodoList extends StatelessWidget{
  @override
   Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
   }
}


class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}