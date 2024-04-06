// task class
class Task {
  String title;
  String description;
  DateTime dueDate;
  String status;

  Task(
      {required this.title,
      required this.description,
      required this.dueDate,
      required this.status});
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
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i].title}');
    }
  }
}

// task inheritance
void main() {
  Homework myHomework = Homework(title: 'Math Homework', description: 'Complete exercises', dueDate: DateTime.now(), status: 'Pending', Subject: 'Math');
  Work myWork = Work(title: 'Project Deadline', description: 'Submit project report', dueDate: DateTime.now(), status: 'Pending', Activity: 'Report Submission');

  myHomework.ListHomework();
  myWork.ListWork();
}

class Homework extends Task {
  String Subject;

  Homework(
      {required String title,
      required String description,
      required DateTime dueDate,
      required String status,
      required this.Subject})
      : super(
            title: title,
            description: description,
            dueDate: dueDate,
            status: status);

  void ListHomework() {
    print('Homework: ${title}, Subject: ${Subject}');
  }
}

class Work extends Task {
  String Activity;

  Work(
      {required String title,
      required String description,
      required DateTime dueDate,
      required String status,
      required this.Activity})
      : super(
            title: title,
            description: description,
            dueDate: dueDate,
            status: status);

  void ListWork() {
    print('Work: ${title}, Activity: ${Activity}');
  }
}
