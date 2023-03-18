import 'package:flutter/material.dart';
import 'factory/task_factory.dart';
import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: ListView()
    );
  }
}

class ListView extends StatelessWidget{
    List<Task> tasks = TaskFactory().generateListTask();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
                title: const Text("Todos")),
            body: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  children: tasks
                      .map((task) => GestureDetector(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailView(task: task)))
                          },
                          child: Container(
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
                          )))
                      .toList()),
            ));
    }
}


class DetailView extends StatelessWidget{
    const DetailView({super.key, required this.task});

    final Task task;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(task.getName())),
        body: Center(child: 
          Column(children: [
            Text(task.getName()),
            Text(task.getInitialDate()),
            Text(task.getEndDate()),
            Text(task.getStatus().toString()),
          ])
        )
      );
    }
}