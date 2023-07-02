import 'package:to_do_list_new/domain/models/task_model.dart';

abstract class TasksRepository {
  //Api
  Future<List<TaskModel>> getTasks();
  Future<void> postTask(String id, element);
  Future<void> editTask(element);
  Future<void> deleteTask(String id);
}
