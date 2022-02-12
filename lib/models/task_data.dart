import 'package:flutter/foundation.dart'; // for ChangeNotifier
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  // * To make sure we don't accidentally add items to [List<Task> _tasks]
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    // * [notifyListener()] is important to change state (add new task)
    notifyListeners();
  }

  // * using [notifyListeners()] as setState to toggle the task
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // To remove task from [List _tasks]
  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
