import 'dart:io';
// Asynchronous Programming with async and await in Dart

void main() {
  performTasks();
}

// After execution ,task1 and task 3 completes immediately but task2 completes after
// a delay of 3 seconds .
// By adding async keyword ,we have access to await .
void performTasks() async {
  task1();
  // task 3 will be execute after 3 seconds if it follows task2()
  // task2() is asynchronous method .
  // await here means we need to wait for task2 to complete
  String res = await task2();
  // task3 relies on task2
  task3(res);
}

//task1 takes negligible amount of time
void task1() {
  String str = "task 1 ";
  print('Task 1 completed');
}

// task 2 runs asynchronously
// Future is like a promise that we will get something in future
// We can also specify that this is going to be a future string or future integer
// In task2 ,we are expecting a future string

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);
  String result;
  // delayed is an asynchronous method because it returns Future.Whenever we see Future in the
  // documentation ,we know the method will be executed asynchronously .

  await Future.delayed(duration, () {
    // It will be executed after 3 seconds are completed
    result = 'task 2';
    print('Task 2 completed');
  });
  return result;
}

// task3 need an input that comes from task2
void task3(String task2Data) {
  String str = "task 3 ";
  print('Task 3 completed with $task2Data');
}
