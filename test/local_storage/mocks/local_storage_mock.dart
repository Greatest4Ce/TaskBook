import 'package:to_do_list_new/data/local_storage/local_storage_util.dart';
import 'package:to_do_list_new/data/server/exeptions/exception.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class LocalStorageUtilMock implements LocalStorageUtil {
  List<TaskModel> _tasks = <TaskModel>[
    TaskModel.create('text1', lastUpdatedBy: '145'),
    TaskModel.create('text2', lastUpdatedBy: '145'),
    TaskModel.create('text3', lastUpdatedBy: '145'),
    TaskModel.create('text4', lastUpdatedBy: '145')
  ];

  @override
  Future<List<TaskModel>> getLocalTasks() {
    return Future.value(_tasks);
  }

  @override
  Future<TaskModel> localEditTask(TaskModel task) {
    _tasks.forEach((element) {
      if (element.id == task.id) {
        element = task;
      }
    });
    return Future.value(task);
  }

  @override
  Future<void> localDeleteTask(String id) {
    for (var i = 0; i < _tasks.length;) {
      if (_tasks[i].id == id) {
        _tasks.removeAt(i);
      }
      return Future.value();
    }
    throw NotFoundException();
  }

  @override
  Future<TaskModel> localSaveTask(TaskModel task) {
    _tasks.add(task);
    return Future.value(task);
  }

  @override
  Future<List<TaskModel>> updateFromApi(tasks) {
    _tasks = tasks;
    return Future.value(tasks);
  }
}
