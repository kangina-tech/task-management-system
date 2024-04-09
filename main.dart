import 'dart:io';

// user input
void main() {
  TaskList taskList = TaskList();

  while (true) {
    print('/nMenu: ');
    print('1. Task');
    print('2. Description');
    print('3. Due Date');
    print('4. Status');
    print('5. Exit');

    stdout.write('Enter task: ');

    String? input = stdin.readLineSync();

    // accessing task list
    switch (input) {
      case '1':
        addTask(taskList);
        break;
      case '2':
        removeTask(taskList);
        break;
      case '3':
        updateTask(taskList);
        break;
      case '4':
        printTask(taskList);
        break;
      case '5':
        print('Exiting program...');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

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
  void printTask() {
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i].title}');
    }
  }
}

// task inheritance
void taskList() {
  Homework myHomework = Homework(
      title: 'Math Homework',
      description: 'Complete exercises',
      dueDate: DateTime.now(),
      status: 'Pending',
      Subject: 'Math');
  Work myWork = Work(
      title: 'Project Deadline',
      description: 'Submit project report',
      dueDate: DateTime.now(),
      status: 'Pending',
      Activity: 'Report Submission');

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
