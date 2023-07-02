import '../../../domain/models/task_model.dart';

class TaskBody {
  TaskModel element;
  TaskBody({required this.element});

  Map<String, dynamic> toMap() {
    return {
      "id": element.id.toString(),
      "text": element.text,
      "importance": element.importance,
      "deadline": element.deadline?.toUtc().millisecondsSinceEpoch,
      "done": element.done,
      "color": null,
      "created_at": element.createdAt.toUtc().millisecondsSinceEpoch,
      "changed_at": element.changedAt.toUtc().millisecondsSinceEpoch,
      "last_updated_by": element.lastUpdatedBy
    };
  }
}
