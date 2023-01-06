import 'package:flutter/material.dart';
import 'package:task_list_app/task.dart';

void main() {
  runApp(
    MaterialApp(
      home: ListaScreen(),
    ),
  );
}

class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  /*
  tasks is where my application will input each one
  from my tasks
  */
  List<Task> tasks = <Task>[];

  /*
  TextEditingController is responsible to control our
  TextField
  */
  TextEditingController controller = TextEditingController();

/*
this method add a task while alter the screen state
and after have done this, clean the TextFiled.
*/
  void AddTask(String name) {
    setState(() {
      tasks.add(Task(name));
    });
    /*
    here the controller.clear() it´s cleaning
    the TextField after a task be added
    */
    controller.clear();
  }

  Widget getTask(Task task) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            task.concluded ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.green,
          ),
          padding: const EdgeInsets.only(left: 10.0, right: 30.0),
          iconSize: 42.0,
          onPressed: () {
            setState(() {
              task.concluded = true;
            });
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(task.name), Text(task.data.toString())],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task List")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: AddTask,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: ((context, index) {
              return getTask(tasks[index]);
            }),
          ))
        ],
      ),
    );
  }
}
