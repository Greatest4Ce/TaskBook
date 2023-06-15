class ApiTask {
  final String id;
  final String status;
  final String taskText;
  final String priority;
  final String deadline;

  ApiTask.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        status = map["status"],
        taskText = map["taskText"],
        priority = map["priority"],
        deadline = map["deadline"];
}
