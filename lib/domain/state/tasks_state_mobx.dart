import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';
import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';
import 'package:to_do_list_new/domain/routes/navigation_manager.dart';
import 'package:to_do_list_new/domain/state/connection_status.dart';
import 'package:uuid/uuid.dart';

import '../../internal/dependencies/repository_module.dart';
import '../models/task_model.dart';

part 'tasks_state_mobx.g.dart';

class TasksState = TasksStateBase with _$TasksState;

abstract class TasksStateBase with Store {
  final TasksRepository tasksRepository = RepositoryModule.tasksRepository();
  final LocalTasksRepository localTasksRepository =
      RepositoryModule.localTasksRepository();
  final ConnectionStatus _connectionStatus = ConnectionStatus.getInstance();

  @computed
  bool get hasConnection => _connectionStatus.hasConnection;

  @observable
  ObservableList<TaskModel> _tasks = <TaskModel>[].asObservable();

  @computed
  List get tasks => _tasks.toList();

  @observable
  bool isLoading = false;

  @observable
  int doneCounter = 0;

  @observable
  bool visibleAll = false;

  @observable
  TaskModel task = TaskModel(
      localOnly: true,
      id: '',
      done: false,
      text: '',
      importance: 'basic',
      deadline: null,
      createdAt: 0,
      changedAt: 0,
      lastUpdatedBy: 145);

  @action
  Future<void> getTasks() async {
    isLoading = true;
    final data = hasConnection
        ? await tasksRepository.getTasks()
        : await localTasksRepository.getLocalTasks();
    _tasks = ObservableList.of(data);
    log('Задачи переданы в ui');
    isLoading = false;
    initDoneCounter();
    NavigationManager.instance.navigateToHome();
  }

  @action
  void initDoneCounter() {
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].done) {
        doneCounter++;
      }
    }
  }

  @action
  void changeVisibleAll() {
    visibleAll = !visibleAll;
  }

  @action
  void saveNewTask() {
    task.id = const Uuid().v1().toString();
    task.createdAt = DateTime.now().toUtc().millisecondsSinceEpoch;
    task.changedAt = DateTime.now().toUtc().millisecondsSinceEpoch;
    _tasks.add(task);
    if (hasConnection) {
      tasksRepository.postTask(task.id, task);
      localTasksRepository.localSaveTask(task);
    } else {
      localTasksRepository.localSaveTask(task);
    }
  }

  @action
  void saveTask(id) {
    task.changedAt = DateTime.now().toUtc().millisecondsSinceEpoch;
    _tasks[_tasks.indexWhere((e) => e.id == id)] = task;
    if (hasConnection) {
      task.localOnly = false;
      tasksRepository.editTask(_tasks[tasks.indexWhere((e) => e.id == id)]);
      localTasksRepository
          .localEditTask(_tasks[_tasks.indexWhere((e) => e.id == id)]);
    } else {
      localTasksRepository
          .localEditTask(_tasks[_tasks.indexWhere((e) => e.id == id)]);
    }
  }

  @action
  void changeTask(id) {
    task = tasks[tasks.indexWhere((e) => e.id == id)];
  }

  @action
  void disposeTask() {
    task = TaskModel(
        localOnly: true,
        id: '',
        done: false,
        text: '',
        importance: 'basic',
        deadline: null,
        createdAt: 0,
        changedAt: 0,
        lastUpdatedBy: 145);
  }

  @action
  void changeTextOfTask(String text) {
    task.text = text;
  }

  @action
  void changePriority(importance) {
    task.importance = importance;
  }

  @action
  void changeDeadline(deadline) {
    task.deadline = deadline;
  }

  @action
  void markAsDone(id) {
    _tasks[_tasks.indexWhere((e) => e.id == id)].done = true;
    hasConnection
        ? tasksRepository.editTask(_tasks[tasks.indexWhere((e) => e.id == id)])
        : localTasksRepository
            .localEditTask(_tasks[_tasks.indexWhere((e) => e.id == id)]);
    doneCounter++;
  }

  @action
  void markAsNotDone(id) {
    _tasks[tasks.indexWhere((e) => e.id == id)].done = false;
    hasConnection
        ? tasksRepository.editTask(_tasks[tasks.indexWhere((e) => e.id == id)])
        : localTasksRepository
            .localEditTask(_tasks[_tasks.indexWhere((e) => e.id == id)]);
    doneCounter--;
  }

  @action
  void deleteTask(id) {
    if (_tasks[_tasks.indexWhere((e) => e.id == id)].done == true) {
      doneCounter--;
    }
    hasConnection
        ? tasksRepository.deleteTask(id)
        : localTasksRepository.localDeleteTask(id);
  }
}
