import 'package:mobx/mobx.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

abstract class LocalTasksRepository {
  //Local
  Future<ObservableList<TaskModel>> getLocalTasks();
  Future<void> localEditTask(TaskModel task);
  Future<void> localSaveTask(TaskModel task);
  Future<void> updateFromApi(dataFromApi);
  Future<void> localDeleteTask(String id);
}
