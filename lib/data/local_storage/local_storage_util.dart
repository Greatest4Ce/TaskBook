import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_new/data/local_storage/models/isar_model.dart';
import 'package:to_do_list_new/data/server/mapper/task_mapper.dart';
import 'package:to_do_list_new/data/server/models/api_task.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

class LocalStorageUtil {
  Isar? _isar;

  Future<Isar> get _isarGetter async {
    final appDir = await getApplicationDocumentsDirectory();

    _isar ??= await Isar.open(
      [TaskModelIsarSchema],
      directory: appDir.path,
    );
    return _isar!;
  }

  Future<List<TaskModel>> getLocalTasks() async {
    final isar = await _isarGetter;
    final items = await isar.taskModelIsars.where().findAll();
    final result = List.of(items.map((item) => TaskModel(
        localOnly: item.localOnly ?? false,
        id: item.taskId.toString(),
        done: item.done ?? false,
        text: item.text ?? '',
        importance: item.importance ?? 'basic',
        deadline: item.deadline,
        createdAt: item.createdAt ?? 0,
        changedAt: item.changedAt ?? 0,
        lastUpdatedBy: item.lastUpdatedBy ?? 0)));
    return result;
  }

  Future<void> localSaveTask({required TaskModel task}) async {
    final isar = await _isarGetter;
    final isarTask = TaskModelIsar()
      ..taskId = task.id
      ..done = task.done
      ..text = task.text
      ..importance = task.importance
      ..deadline = task.deadline
      ..createdAt = task.createdAt
      ..changedAt = task.changedAt
      ..lastUpdatedBy = task.lastUpdatedBy;
    isar.writeTxn(() async {
      await isar.taskModelIsars.put(isarTask);
    });
  }

  Future<void> localEditTask({required TaskModel task}) async {
    final isar = await _isarGetter;
    final taskToEdit =
        await isar.taskModelIsars.filter().taskIdEqualTo(task.id).findFirst();
    if (taskToEdit != null) {
      taskToEdit
        ..done = task.done
        ..text = task.text
        ..importance = task.importance
        ..deadline = task.deadline
        ..changedAt = task.changedAt
        ..lastUpdatedBy = task.lastUpdatedBy;
      await isar.writeTxn(() async {
        await isar.taskModelIsars.put(taskToEdit);
      });
    }
  }

  Future<void> localDeleteTask({required String id}) async {
    final isar = await _isarGetter;
    isar.writeTxn(
      () async {
        final task =
            await isar.taskModelIsars.filter().taskIdEqualTo(id).deleteAll();
        return task;
      },
    );

    log('Удалена задача с id: $id');
  }

  Future<void> updateFromApi({required data}) async {
    List<TaskModel> tasks = [];
    final isar = await _isarGetter;
    await isar.writeTxn(() => isar.taskModelIsars.clear());
    for (var e in data.tasksList) {
      tasks.add(TaskMapper.fromJson(ApiTask.allFromApi(e)));
    }
    for (var element in tasks) {
      localSaveTask(task: element);
    }
  }
}
