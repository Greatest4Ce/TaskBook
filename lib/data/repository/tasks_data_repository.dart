import 'package:to_do_list_new/data/api_util.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';
import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';

class TasksDataRepository extends TasksStateRepository {
  final ApiUtil _apiUtil;

  TasksDataRepository(this._apiUtil);

  @override
  Future<List<TaskModel>> getTasks() {
    return _apiUtil.getTasks();
  }
}
