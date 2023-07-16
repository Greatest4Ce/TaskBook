class TaskModel {
  String id;
  bool done;
  String text;
  String importance;
  DateTime? deadline;
  int createdAt;
  int changedAt;
  var lastUpdatedBy;
  TaskModel(
      {required this.id,
      required this.done,
      required this.text,
      required this.importance,
      required this.deadline,
      required this.createdAt,
      required this.changedAt,
      required this.lastUpdatedBy});
}
