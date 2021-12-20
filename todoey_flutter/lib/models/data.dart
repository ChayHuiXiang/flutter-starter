import 'dart:collection';
import 'package:flutter/material.dart';
import 'task.dart';

class Data extends ChangeNotifier{
  List<Task> _taskList = [
    Task(name: 'Buy Milk'),
    Task(name: 'Get Milk'),
    Task(name: 'Drink Milk'),
  ];

  void addTask(String? newTaskName){
    if (newTaskName != null){
      _taskList.add(Task(name: newTaskName));
      notifyListeners();
    }
  }

  void toggleTask(int index){
    _taskList[index].toggleTask();
    notifyListeners();
  }

  void deleteTask(int index){
    _taskList.removeAt(index);
    notifyListeners();
  }

  UnmodifiableListView get taskList {
    return UnmodifiableListView(_taskList);
  }

  int get taskCount {
    return _taskList.length;
  }
}