class Task {
  Task({required this.name, this.isDone = false});

  bool isDone;
  final String name;

  void toggleDone() {
    isDone = !isDone;
  }
}
