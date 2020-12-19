import 'dart:io';

void main() {
  performTasks();
}

void performTasks()  async{
  String task1result = await task1();
  String task2result = await task2(task1result);
  task3(task2result);
}


Future<String> task1() async{
  String result;
  Duration duration = Duration(seconds: 3);
  await Future.delayed(duration, (){
  print('task 1 done');
  result = 'task 1 data';
  });
  return result;
}


Future<String> task2(String task1data) async{

  Duration duration = Duration(seconds: 3);
  String result;
  await Future.delayed(duration, (){
    print('task 2 done with $task1data');
    result = 'task 2 data';
  });
  return result;
}


void task3(String task2data){
  print('task 3 done with $task2data');
}
