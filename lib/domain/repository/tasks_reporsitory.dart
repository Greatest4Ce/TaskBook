import 'package:mobx/mobx.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

abstract class TasksRepository {
  //Api
  Future<ObservableList<TaskModel>> getTasks();
  Future<TaskModel> postTask(String id, element);
  Future<TaskModel> editTask(element);
  Future deleteTask(String id);
}
