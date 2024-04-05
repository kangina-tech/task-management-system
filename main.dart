 // task class
class Task {
  String title;
  String description;
  DateTime dueDate;
  String status;

  Task({required this.title, required this.description, required this.dueDate, required this.status });
}

// task list class
class TaskList {
  List<Task> tasks = [];
  // add tasks
  void addTask(Task task) {
    tasks.add(task);
  }
  // remove tasks
  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
    }
  }
  // update tasks
  void updateTask(int index, Task updatedTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = updatedTask;
    }
  }
  // display
  void printTasks() {
    for(int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i].title}');
    }
  }
}