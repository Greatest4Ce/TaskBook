class ApiTask {
  final String id;
  final String text;
  final String importance;
  DateTime? deadline;
  final bool done;
  final DateTime createdAt;
  final DateTime changedAt;
  String lastUpdatedBy;
  ApiTask.allFromApi(Map<String, dynamic> map)
      : id = map["id"],
        text = map["text"],
        importance = map["importance"],
        deadline = map["deadline"] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                map["deadline"],
              )
            : null,
        done = map["done"],
        createdAt = DateTime.fromMillisecondsSinceEpoch(
          map["created_at"],
        ),
        changedAt = DateTime.fromMillisecondsSinceEpoch(
          map["changed_at"],
        ),
        lastUpdatedBy = map["last_updated_by"];
  ApiTask.singleFromApi(Map<String, dynamic> map)
      : id = map["element"]["id"],
        text = map["element"]["text"],
        importance = map["element"]["importance"],
        deadline = map["element"]["deadline"] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                map["element"]["deadline"],
              )
            : null,
        done = map["element"]["done"],
        createdAt = map["element"]["created_at"],
        changedAt = map["element"]["changed_at"],
        lastUpdatedBy = map["element"]["last_updated_by"];
}
