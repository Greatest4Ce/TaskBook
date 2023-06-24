import 'package:mobx/mobx.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';
import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';

import '../api_util.dart';

class TasksDataRepository extends TasksRepository {
  final ApiUtil _apiUtil;

  TasksDataRepository(this._apiUtil);

  @override
  Future<ObservableList<TaskModel>> getTasks() {
    return _apiUtil.getTasks();
  }

  @override
  Future<TaskModel> postTask(String id, element) {
    return _apiUtil.postTask(id, element);
  }

  @override
  Future<TaskModel> editTask(element) {
    return _apiUtil.editTask(element);
  }

  @override
  Future deleteTask(String id) {
    return _apiUtil.deleteTask(id);
  }
}
