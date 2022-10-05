import 'package:flutter/material.dart';
import 'package:task_list_app/task.dart';

// main run the application
void main() {
  runApp(
    MaterialApp(
      home: new ListaScreen(),
    ),
  );
}

/* all class that stems from StatefulWidget
release a method that let us change the 
screen state
 */
class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
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
  TextEditingController controller = new TextEditingController();

/*
this method add a task while alter the screen state
and after have done this, clean the TextFiled.
*/
  void AddTask(String name) {
    /*
    setState is the method that let change the
    screen state while add the task
    */
    setState(() {
      tasks.add(Task(name));
    });
    /*
    here the controller.clear() it´s cleaning
    the TextField after a task be added
    */
    controller.clear();
  }

/*
on this method i define my row with the components in
 which my task will need
*/
  Widget getTask(Task task) {
    // here i declare a new row, returning itself
    return new Row(
      // setting the vertical position
      crossAxisAlignment: CrossAxisAlignment.center,

      //creating the children
      children: [
        //setting a button
        IconButton(
          // setting the button icon
          icon: new Icon(
            //button logic
            task.concluded ? Icons.check_box : Icons.check_box_outline_blank,
            //icon color
            color: Colors.green,
          ),
          // setting the button padding
          padding: EdgeInsets.only(left: 10.0, right: 30.0),
          //setting the icon size
          iconSize: 42.0,
          // here i input the check sinal(take a look on line 71)
          onPressed: () {
            setState(() {
              task.concluded = true;
            });
          },
        ),
        //here i declare a new Column
        new Column(
          //setting the horizontal position
          crossAxisAlignment: CrossAxisAlignment.start,
          //creating the children
          children: [Text(task.name), Text(task.data.toString())],
        )
      ],
    );
  }

  //on this method i build the whole screen (apart the row above)
  Widget build(BuildContext context) {
    //here i declare new Scaffold
    return new Scaffold(
      //declaring a appBar with AppBar inside
      appBar: new AppBar(title: new Text("Task List")),
      //here i start a body
      body: Column(
        //setting the vertical size
        mainAxisAlignment: MainAxisAlignment.center,
        //creating the children
        children: [
          // creating the first children as a Container
          Container(
            //setting the padding
            padding: EdgeInsets.all(8.0),
            //creating the child as a TextField
            child: TextField(
              //setting a controller
              controller: controller,
              //here OnSubmitted and AddTask are assigned the same value
              onSubmitted: AddTask,
            ),
          ),
          //here i create a expanded to scroll the screen without problem
          Expanded(
              //here i declare a child as a ListView.Builder
              child: ListView.builder(
            // here i declare the element quantity(element = task)
            itemCount: tasks.length,
            //here to each task, create an element
            itemBuilder: ((context, index) {
              return getTask(tasks[index]);
            }),
          ))
        ],
      ),
    );
  }
}
