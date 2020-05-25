import 'dart:io';

// Synchronous Programming in Dart
void main() {
  performTasks();
}

// task1,task2 and task3 runs synchronously.
void performTasks() {
  task1();
  task2();
  task3();
}

//task1 takes negligible amount of time
void task1() {
  String str = "task 1 ";
  print('Task 1 completed');
}

// task2 is a time consuming task.
void task2() {
  // Set sleep time of 3 seconds
  Duration duration = Duration(seconds: 3);
  // sleep is synchronized
  sleep(duration);
  // After 3 seconds the following statements are executed
  String str = "task 2 ";
  print('Task 2 completed');
}

//task3 takes negligible  amount of time
void task3() {
  String str = "task 3 ";
  print('Task 3 completed');
}
