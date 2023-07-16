import 'package:to_do_list_new/domain/models/task_model.dart';

abstract class LocalTasksRepository {
  //Local
  Future<List<TaskModel>> getLocalTasks();
  Future<TaskModel> localEditTask(TaskModel task);
  Future<TaskModel> localSaveTask(TaskModel task);
  Future<void> localDeleteTask(String id);
  Future<void> updateLocalFromApi(data);
}
