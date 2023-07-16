import 'package:to_do_list_new/data/local_storage/models/isar_model.dart';

class LocalTaskBody {
  TaskModelIsar element;
  LocalTaskBody({required this.element});

  Map<String, dynamic> toApi() {
    return {
      "element": {
        "id": element.taskId.toString(),
        "text": element.text,
        "importance": element.importance,
        "deadline": element.deadline!.toUtc().millisecondsSinceEpoch,
        "done": element.done,
        "color": null,
        "created_at": element.createdAt,
        "changed_at": element.changedAt,
        "last_updated_by": element.lastUpdatedBy
      }
    };
  }
}
