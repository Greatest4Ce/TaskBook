import 'package:to_do_list_new/data/local_storage/models/isar_model.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class LocalTaskBody {
  TaskModel task;
  LocalTaskBody({required this.task});

  TaskModelIsar toIsar() {
    return TaskModelIsar()
      ..taskId = task.id
      ..text = task.text
      ..done = task.done
      ..deadline = task.deadline
      ..importance = task.importance
      ..changedAt = task.changedAt
      ..createdAt = task.createdAt
      ..lastUpdatedBy = task.lastUpdatedBy;
  }
}
