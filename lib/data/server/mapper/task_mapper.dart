import 'package:to_do_list_new/domain/models/task_model.dart';
import '../models/api_task.dart';

class TaskMapper {
  static TaskModel fromJson(ApiTask task) {
    return TaskModel(
        id: task.id.toString(),
        done: task.done,
        text: task.text.toString(),
        importance: task.importance,
        deadline: task.deadline,
        createdAt: task.createdAt,
        changedAt: task.createdAt,
        lastUpdatedBy: task.lastUpdatedBy);
  }
}
