import '../../../domain/models/task_model.dart';

class TaskBody {
  TaskModel element;
  TaskBody({required this.element});

  Map<String, dynamic> toApi() {
    return {
      "element": {
        "id": element.id.toString(),
        "text": element.text,
        "importance": element.importance,
        "deadline": element.deadline?.toUtc().millisecondsSinceEpoch,
        "done": element.done,
        "color": null,
        "created_at": element.createdAt,
        "changed_at": element.changedAt,
        "last_updated_by": '${element.lastUpdatedBy}'
      }
    };
  }
}
