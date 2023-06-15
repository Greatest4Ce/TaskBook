import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_new/data/models/api_task.dart';

class TaskService {
  Future<List<ApiTask>> getTasks() async {
    final String response = await _readUserTasks();
    final data = await json.decode(response);
    List<ApiTask> tasks = [];
    data["tasks"].forEach((e) {
      tasks.add(ApiTask.fromJson(e));
    });
    log('$tasks');
    return tasks;
  }

  Future<dynamic> _readUserTasks() async {
    String userTasksPath = await _getUserTasksPath();
    File userTasks = File(userTasksPath);
    final bool userTasksExists = userTasks.existsSync();
    if (userTasksExists) {
      final String res = await userTasks.readAsString();
      return res;
    } else {
      return await _createUserTasks();
    }
  }

  Future<String> _createUserTasks() async {
    final File userTasksPath = File(await _getUserTasksPath());
    File userTasks = File('${userTasksPath.path}/userTasks.json');
    final Map<String, dynamic> userTasksList = await jsonDecode(
        await rootBundle.loadString('assets/default_tasks.json'));
    userTasks.writeAsString(jsonEncode(userTasksList));
    final String res = await userTasks.readAsString();
    return res;
  }

  Future<String> _getUserTasksPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
