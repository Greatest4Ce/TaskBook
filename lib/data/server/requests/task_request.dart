class TaskRequest {
  final Map<String, dynamic> task;

  TaskRequest({required this.task});

  Map<String, dynamic> toApi() {
    return {"element": task};
  }
}
