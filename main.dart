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
        taskList.printTask();
        break;
      case '5':
        print('Exiting program...');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

// Function to add a task
void addTask(TaskList taskList) {
  print('\nEnter task details:');
  stdout.write('Title: ');
  String title = stdin.readLineSync() ?? '';

  stdout.write('Description: ');
  String description = stdin.readLineSync() ?? '';

  stdout.write('Due Date (YYYY-MM-DD): ');
  DateTime dueDate = DateTime.parse(stdin.readLineSync() ?? '');

  stdout.write('Status: ');
  String status = stdin.readLineSync() ?? '';

  Task task = Task(
      title: title, description: description, dueDate: dueDate, status: status);
  taskList.addTask(task); // Add task to the task list
  print('Task added successfully.');
}

// Function to remove a task
void removeTask(TaskList taskList) {
  stdout.write('Enter the index of the task to remove: ');
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index != null) {
    taskList.removeTask(index - 1); // Remove task at the specified index
    print('Task removed successfully.');
  } else {
    print('Invalid index.');
  }
}

// Function to update a task
void updateTask(TaskList taskList) {
  stdout.write('Enter the index of the task to update: ');
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index != null && index >= 1 && index <= taskList.tasks.length) {
    Task task = taskList.tasks[index - 1];

    print('\nEnter updated task details:');
    stdout.write('Title: ');
    String title = stdin.readLineSync() ?? '';

    stdout.write('Description: ');
    String description = stdin.readLineSync() ?? '';

    stdout.write('Due Date (YYYY-MM-DD): ');
    DateTime dueDate = DateTime.parse(stdin.readLineSync() ?? '');

    stdout.write('Status: ');
    String status = stdin.readLineSync() ?? '';

    taskList.updateTask(
        index - 1,
        Task(
            title: title,
            description: description,
            dueDate: dueDate,
            status: status));
    print('Task updated successfully.');
  } else {
    print('Invalid index.');
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

  // Method to display tasks
  void printTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('\nTasks:');
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i].title}');
      }
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
