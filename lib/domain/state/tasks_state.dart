// import 'dart:math';
// import 'dart:developer' as dev;
// import 'package:flutter/material.dart';
// import 'package:to_do_list_new/domain/models/task_model.dart';
// import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';

// class TasksState with ChangeNotifier {
//   TasksState(this._tasksDataRepository);
//   late List<TaskModel> _tasks;

//   final TasksRepository _tasksDataRepository;

//   bool isLoading = false;

//   Future<void> getTasks() async {
//     final data = await _tasksDataRepository.getTasks();
//     _tasks = data;
//   }

//   TaskModel _task = TaskModel(
//       id: '', done: false, text: '', importance: 'Нет', deadline: null);
//   bool visibleAll = false;
//   final List<bool> _visibleList = [];
//   int _doneCounter = 0;

//   List<TaskModel> get tasks => _tasks;
//   TaskModel get task => _task;
//   int get doneCounter => _doneCounter;

//   void initProvider() {
//     initDoneCounter();
//     // initVisibleList();
//   }

//   void initDoneCounter() {
//     for (int i = 0; i < _tasks.length; i++) {
//       if (_tasks[i].done == "done") {
//         _doneCounter++;
//       }
//     }
//   }

//   void allVisible() {
//     if (visibleAll == true) {
//       visibleAll = false;
//     } else {
//       visibleAll = true;
//     }
//     notifyListeners();
//   }

//   void enableVisibleAll() {
//     visibleAll = true;
//     _visibleList.map((e) => e = true);
//     notifyListeners();
//   }

//   void disableVisibleAll() {
//     // initVisibleList();
//     visibleAll = false;
//     notifyListeners();
//   }

//   void disposeTask() {
//     _task = TaskModel(
//         id: '', done: false, text: '', importance: 'Нет', deadline: null);
//     notifyListeners();
//   }

//   void taskChange(id) {
//     _task = tasks.singleWhere((e) => e.id == id);
//     notifyListeners();
//   }

//   void changePriority(priority) {
//     _task.importance = priority;
//     notifyListeners();
//   }

//   void changeText(text) {
//     _task.text = text;
//     notifyListeners();
//   }

//   void changeDeadline(DateTime deadline) {
//     _task.deadline = deadline;
//     notifyListeners();
//   }

//   void savetask(id) {
//     _tasks[_tasks.indexWhere((e) => e.id == id)] = _task;
//     notifyListeners();
//     dev.log('Сохранены изменения в задании с id: $id');
//   }

//   void saveNewTask() {
//     int id = 1;
//     while (_tasks.any((e) => e.id == id.toString())) {
//       id = Random().nextInt(100);
//     }
//     _task.id = (id).toString();
//     _tasks.add(_task);
//     notifyListeners();
//     dev.log('Сохранено новое задание с id: $id');
//   }

//   void markAsDone(id) {
//     _tasks[tasks.indexWhere((e) => e.id == id)].done = true;
//     _doneCounter++;
//     notifyListeners();
//     dev.log('Задание с id: $id  помечено как "выполнено"');
//   }

//   void deleteTask(id) {
//     if (_tasks[tasks.indexWhere((e) => e.id == id)].done == true) {
//       _doneCounter--;
//     }
//     _tasks.removeWhere((e) => e.id == id);
//     notifyListeners();
//     dev.log('Удалено задание с id: $id');
//   }
// }
