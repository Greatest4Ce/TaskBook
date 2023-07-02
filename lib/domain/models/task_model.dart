import 'package:isar/isar.dart';

@collection
class TaskModel {
  Id get isarId => fastHash(id);

  String id;
  bool done;
  String text;
  String importance;
  DateTime? deadline;
  DateTime createdAt;
  DateTime changedAt;
  int lastUpdatedBy;
  TaskModel(
      {required this.id,
      required this.done,
      required this.text,
      required this.importance,
      required this.deadline,
      required this.createdAt,
      required this.changedAt,
      required this.lastUpdatedBy});

  TaskModel copyWith({
    String? id,
    bool? done,
    String? text,
    String? importance,
    DateTime? deadline,
    DateTime? createdAt,
    DateTime? changedAt,
    int? lastUpdatedBy,
  }) {
    return TaskModel(
        id: id ?? this.id,
        done: done ?? this.done,
        text: text ?? this.text,
        importance: importance ?? this.importance,
        deadline: deadline ?? this.deadline,
        createdAt: createdAt ?? this.createdAt,
        changedAt: changedAt ?? this.createdAt,
        lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy);
  }
}
