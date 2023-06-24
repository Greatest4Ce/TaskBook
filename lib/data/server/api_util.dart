import 'package:mobx/mobx.dart';
import 'package:to_do_list_new/data/server/mapper/task_mapper.dart';
import 'package:to_do_list_new/data/server/models/api_task.dart';
import 'package:to_do_list_new/data/server/service/task_service.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class ApiUtil {
  final TaskService _taskService;

  ApiUtil(this._taskService);

  Future<ObservableList<TaskModel>> getTasks() async {
    final result = await _taskService.getTasks();
    ObservableList<TaskModel> tasks = ObservableList.of([]);
    for (var e in result.tasksList) {
      tasks.add(TaskMapper.fromJson(ApiTask.allFromApi(e)));
    }
    return tasks;
  }

  Future<TaskModel> postTask(String id, element) async {
    final result = await _taskService.postTask(id, element);
    TaskModel task = TaskMapper.fromJson(ApiTask.singleFromApi(result));
    return task;
  }

  Future<TaskModel> editTask(element) async {
    final result = await _taskService.editTask(element);
    TaskModel task = TaskMapper.fromJson(ApiTask.singleFromApi(result));
    return task;
  }

  Future deleteTask(String id) async {
    final result = await _taskService.deleteTask(id);
    return result;
  }
}
