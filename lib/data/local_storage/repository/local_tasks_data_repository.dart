import 'package:to_do_list_new/data/local_storage/local_storage_util.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';

class LocalTasksDataRepository implements LocalTasksRepository {
  final LocalStorageUtil _localStorageUtil;

  LocalTasksDataRepository(this._localStorageUtil);

  @override
  Future<List<TaskModel>> getLocalTasks() {
    return _localStorageUtil.getLocalTasks();
  }

  @override
  Future<TaskModel> localSaveTask(TaskModel task) {
    return _localStorageUtil.localSaveTask(task);
  }

  @override
  Future<TaskModel> localEditTask(TaskModel task) {
    return _localStorageUtil.localEditTask(task);
  }

  @override
  Future<void> localDeleteTask(String id) {
    return _localStorageUtil.localDeleteTask(id);
  }

  @override
  Future<void> updateLocalFromApi(data) {
    return _localStorageUtil.updateFromApi(data);
  }
}
