class TaskModel {
  String id;
  String status;
  String taskText;
  String priority;
  String deadline;
  TaskModel(
      {required this.id,
      required this.status,
      required this.taskText,
      required this.priority,
      required this.deadline});
}
