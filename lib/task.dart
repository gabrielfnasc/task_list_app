// ignore_for_file: prefer_initializing_formals

class Task {
  late String name;
  late DateTime data;
  late bool concluded;

  Task(String name) {
    this.name = name;
    data = DateTime.now();
    concluded = false;
  }
}
