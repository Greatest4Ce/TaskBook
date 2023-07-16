// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_state_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksState on TasksStateBase, Store {
  Computed<bool>? _$hasConnectionComputed;

  @override
  bool get hasConnection =>
      (_$hasConnectionComputed ??= Computed<bool>(() => super.hasConnection,
              name: 'TasksStateBase.hasConnection'))
          .value;
  Computed<List<dynamic>>? _$tasksComputed;

  @override
  List<dynamic> get tasks =>
      (_$tasksComputed ??= Computed<List<dynamic>>(() => super.tasks,
              name: 'TasksStateBase.tasks'))
          .value;

  late final _$_tasksAtom =
      Atom(name: 'TasksStateBase._tasks', context: context);

  @override
  ObservableList<TaskModel> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<TaskModel> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'TasksStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$doneCounterAtom =
      Atom(name: 'TasksStateBase.doneCounter', context: context);

  @override
  int get doneCounter {
    _$doneCounterAtom.reportRead();
    return super.doneCounter;
  }

  @override
  set doneCounter(int value) {
    _$doneCounterAtom.reportWrite(value, super.doneCounter, () {
      super.doneCounter = value;
    });
  }

  late final _$visibleAllAtom =
      Atom(name: 'TasksStateBase.visibleAll', context: context);

  @override
  bool get visibleAll {
    _$visibleAllAtom.reportRead();
    return super.visibleAll;
  }

  @override
  set visibleAll(bool value) {
    _$visibleAllAtom.reportWrite(value, super.visibleAll, () {
      super.visibleAll = value;
    });
  }

  late final _$taskAtom = Atom(name: 'TasksStateBase.task', context: context);

  @override
  TaskModel get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(TaskModel value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$getTasksAsyncAction =
      AsyncAction('TasksStateBase.getTasks', context: context);

  @override
  Future<void> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$TasksStateBaseActionController =
      ActionController(name: 'TasksStateBase', context: context);

  @override
  void initDoneCounter() {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.initDoneCounter');
    try {
      return super.initDoneCounter();
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisibleAll() {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.changeVisibleAll');
    try {
      return super.changeVisibleAll();
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveNewTask() {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.saveNewTask');
    try {
      return super.saveNewTask();
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveTask(dynamic id) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.saveTask');
    try {
      return super.saveTask(id);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTask(dynamic id) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.changeTask');
    try {
      return super.changeTask(id);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeTask() {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.disposeTask');
    try {
      return super.disposeTask();
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTextOfTask(String text) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.changeTextOfTask');
    try {
      return super.changeTextOfTask(text);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePriority(dynamic importance) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.changePriority');
    try {
      return super.changePriority(importance);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDeadline(dynamic deadline) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.changeDeadline');
    try {
      return super.changeDeadline(deadline);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAsDone(dynamic id) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.markAsDone');
    try {
      return super.markAsDone(id);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAsNotDone(dynamic id) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.markAsNotDone');
    try {
      return super.markAsNotDone(id);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(dynamic id) {
    final _$actionInfo = _$TasksStateBaseActionController.startAction(
        name: 'TasksStateBase.deleteTask');
    try {
      return super.deleteTask(id);
    } finally {
      _$TasksStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
doneCounter: ${doneCounter},
visibleAll: ${visibleAll},
task: ${task},
hasConnection: ${hasConnection},
tasks: ${tasks}
    ''';
  }
}
