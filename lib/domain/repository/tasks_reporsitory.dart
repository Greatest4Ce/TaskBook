import 'package:to_do_list_new/domain/models/task_model.dart';

abstract class TasksStateRepository {
  Future<List<TaskModel>> getTasks();
}
