import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_new/data/local_storage/local_storage_util.dart';
import 'package:to_do_list_new/domain/models/task_model.dart';

import 'mocks/local_storage_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('LOCAL TASK', () {
    late LocalStorageUtil localTasks;
    var tasks = <TaskModel>[
      TaskModel.create('text1', lastUpdatedBy: '145'),
      TaskModel.create('text2', lastUpdatedBy: '145'),
      TaskModel.create('text3', lastUpdatedBy: '145')
    ];

    setUpAll(() async {
      localTasks = LocalStorageUtilMock();
      tasks = await localTasks.updateFromApi(tasks);
    });

    test("get all", () async {
      final task = await localTasks.getLocalTasks();
      expect(task, tasks);
    });
    test("patch", () async {
      final task = await localTasks.updateFromApi(tasks);
      expect(task, tasks);
    });

    test("delete task", () async {
      final len = tasks.length;
      await localTasks.localDeleteTask(tasks[2].id);
      final task = await localTasks.getLocalTasks();
      expect(len, task.length);
    });
  });
}
