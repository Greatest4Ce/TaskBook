import 'package:to_do_list_new/data/local_storage/local_storage_util.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';

class LocalTasksDataRepository extends LocalTasksRepository {
  final LocalStorageUtil _localStorageUtil;

  LocalTasksDataRepository(this._localStorageUtil);

  @override
  Future<List<TaskModel>> getLocalTasks() {
    return _localStorageUtil.getLocalTasks();
  }

  @override
  Future<void> localSaveTask(TaskModel task) {
    return _localStorageUtil.localSaveTask(task: task);
  }

  @override
  Future<void> localEditTask(TaskModel task) {
    return _localStorageUtil.localEditTask(task: task);
  }

  @override
  Future<void> localDeleteTask(String id) {
    return _localStorageUtil.localDeleteTask(id: id);
  }

  @override
  Future<void> updateLocalFromApi(data) {
    return _localStorageUtil.updateFromApi(data: data);
  }
}
