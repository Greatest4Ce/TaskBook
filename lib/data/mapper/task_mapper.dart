import 'package:to_do_list_new/data/models/api_task.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class TaskMapper {
  static TaskModel fromJson(ApiTask task) {
    return TaskModel(
        id: task.id.toString(),
        status: task.status.toString(),
        taskText: task.taskText.toString(),
        priority: task.priority.toString(),
        deadline: task.deadline);
  }
}
