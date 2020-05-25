import 'dart:io';
// Asynchronous Programming in Dart

void main() {
  performTasks();
}

// After execution ,task1 and task 3 completes immediately but task2 completes after
// a delay of 3 seconds .
void performTasks() {
  task1();
  // task2() is asynchronous method .
  task2();
  // task 3 will be execute after 3 seconds if it follows task2()
  task3();
}

//task1 takes negligible  amount of time
void task1() {
  String str = "task 1 ";
  print('Task 1 completed');
}

//task3 takes negligible  amount of time
void task3() {
  String str = "task 3 ";
  print('Task 3 completed');
}

// task 3 runs asynchronously
void task2() {
  Duration duration = Duration(seconds: 3);
  // delayed is an asynchronous method because it returns Future.Whenever we see Future in the
  // documentation ,we know the method will be executed asynchronously .
  Future.delayed(duration, () {
    // It will be executed after 3 seconds are completed
    String str = 'task 2';
    print('Task 2 completed');
  });
}
