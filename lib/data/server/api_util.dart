import 'package:to_do_list_new/data/server/mapper/task_mapper.dart';
import 'package:to_do_list_new/data/server/models/api_task.dart';
import 'package:to_do_list_new/data/server/service/task_service.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class ApiUtil {
  final TaskService _taskService;

  ApiUtil(this._taskService);

  Future<List<TaskModel>> getTasks() async {
    final result = await _taskService.getTasks();
    List<TaskModel> tasks = [];
    for (var e in result.tasksList) {
      tasks.add(TaskMapper.fromJson(ApiTask.allFromApi(e)));
    }
    return tasks;
  }

  Future<void> postTask(String id, element) async {
    await _taskService.postTask(id, element);
  }

  Future<void> editTask(element) async {
    await _taskService.editTask(element);
  }

  Future<void> deleteTask(String id) async {
    await _taskService.deleteTask(id);
  }
}
