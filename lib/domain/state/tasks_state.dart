import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class TasksState with ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(
        id: '1',
        status: 'active',
        taskText: 'Купить молоко',
        priority: 'Низкий',
        deadline: ''),
    TaskModel(
        id: '2',
        status: 'done',
        taskText: 'Купить хлеб ',
        priority: 'Низкий',
        deadline: ''),
    TaskModel(
        id: '3',
        status: 'active',
        taskText: 'Купить яица',
        priority: 'Высокий',
        deadline: '10.12.2023'),
    TaskModel(
        id: '4',
        status: 'active',
        taskText:
            'Купить молоко, хлеб, конфеты, молоко, хлеб, конфеты, молоко, хлеб, конфеты, молоко, хлеб, конфеты, молоко, хлеб, конфеты',
        priority: 'Нет',
        deadline: '10.12.2023'),
    TaskModel(
        id: '5',
        status: 'active',
        taskText: 'Купить молоко ',
        priority: 'Низкий',
        deadline: '10.12.2023'),
    TaskModel(
        id: '6',
        status: 'done',
        taskText: 'Купить хлеб ',
        priority: 'Низкий',
        deadline: ''),
    TaskModel(
        id: '7',
        status: 'active',
        taskText: 'Купить яица',
        priority: 'Высокий',
        deadline: '10.12.2023'),
    TaskModel(
        id: '8',
        status: 'active',
        taskText: 'Купить молоко',
        priority: 'Низкий',
        deadline: '10.12.2023'),
    TaskModel(
        id: '9',
        status: 'done',
        taskText: 'Купить хлеб',
        priority: 'Низкий',
        deadline: ''),
    TaskModel(
        id: '10',
        status: 'active',
        taskText: 'Купить яица',
        priority: 'Высокий',
        deadline: '10.12.2023'),
  ];
  TaskModel _task = TaskModel(
      id: '', status: '', taskText: '', priority: 'Нет', deadline: '');
  bool visibleAll = false;
  final List<bool> _visibleList = [];
  int _doneCounter = 0;

  List<TaskModel> get tasks => _tasks;
  TaskModel get task => _task;
  int get doneCounter => _doneCounter;

  void initProvider() {
    initDoneCounter();
    // initVisibleList();
  }

  void initDoneCounter() {
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].status == "done") {
        _doneCounter++;
      }
    }
  }

  void allVisible() {
    if (visibleAll == true) {
      visibleAll = false;
    } else {
      visibleAll = true;
    }
    notifyListeners();
  }

  void enableVisibleAll() {
    visibleAll = true;
    _visibleList.map((e) => e = true);
    notifyListeners();
  }

  void disableVisibleAll() {
    // initVisibleList();
    visibleAll = false;
    notifyListeners();
  }

  void disposeTask() {
    _task = TaskModel(
        id: '', status: '', taskText: '', priority: 'Нет', deadline: '');
    notifyListeners();
  }

  void taskChange(id) {
    _task = tasks.singleWhere((e) => e.id == id);
    notifyListeners();
  }

  void changePriority(priority) {
    _task.priority = priority;
    notifyListeners();
  }

  void changeText(text) {
    _task.taskText = text;
    notifyListeners();
  }

  void changeDeadline(deadline) {
    _task.deadline = deadline;
    notifyListeners();
  }

  void savetask(id) {
    _tasks[_tasks.indexWhere((e) => e.id == id)] = _task;
    notifyListeners();
    dev.log('Сохранены изменения в задании с id: $id');
  }

  void saveNewTask() {
    int id = 1;
    while (_tasks.any((e) => e.id == id.toString())) {
      id = Random().nextInt(100);
    }
    _task.id = (id).toString();
    _tasks.add(_task);
    notifyListeners();
    dev.log('Сохранено новое задание с id: $id');
  }

  void markAsDone(id) {
    _tasks[tasks.indexWhere((e) => e.id == id)].status = "done";
    _doneCounter++;
    notifyListeners();
    dev.log('Задание с id: $id  помечено как "выполнено"');
  }

  void deleteTask(id) {
    if (_tasks[tasks.indexWhere((e) => e.id == id)].status == "done") {
      _doneCounter--;
    }
    _tasks.removeWhere((e) => e.id == id);
    notifyListeners();
    dev.log('Удалено задание с id: $id');
  }
}
