import 'dart:developer';

import 'package:to_do_list_new/data/mapper/task_mapper.dart';
import 'package:to_do_list_new/data/service/task_service.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class ApiUtil {
  final TaskService _taskService;

  ApiUtil(this._taskService);

  Future<List<TaskModel>> getTasks() async {
    final result = await _taskService.getTasks();
    List<TaskModel> tasks = [];
    result.map((e) {
      tasks.add(TaskMapper.fromJson(e));
    });
    log('$tasks');
    return tasks;
  }
}
