import 'package:isar/isar.dart';

part 'isar_model.g.dart';

@Collection()
class TaskModelIsar {
  Id id = Isar.autoIncrement;

  bool? localOnly;
  String? taskId;
  bool? done;
  String? text;
  String? importance;
  DateTime? deadline;
  int? createdAt;
  int? changedAt;
  int? lastUpdatedBy;
}
