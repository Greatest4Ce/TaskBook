import 'package:to_do_list_new/data/server/requests/task_body.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class TaskListRequest {
  final List<TaskModel> list;

  TaskListRequest({
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((e) => TaskBody(element: e).toMap()).toList(),
    };
  }
}
