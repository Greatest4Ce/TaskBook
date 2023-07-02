import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@Collection()
class TaskModelIsar {
  Id isarId = Isar.autoIncrement;

  String? taskId;
  bool? done;
  String? text;
  String? importance;
  DateTime? deadline;
  DateTime? createdAt;
  DateTime? changedAt;
  String? lastUpdatedBy;
}
