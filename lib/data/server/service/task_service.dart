import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:to_do_list_new/data/env/env.dart';
import 'package:to_do_list_new/data/server/models/api_task_list.dart';
import 'package:to_do_list_new/data/server/request/task_body.dart';
import 'package:to_do_list_new/data/server/request/task_list_request.dart';
import 'package:to_do_list_new/data/server/request/task_request.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';
import 'package:to_do_list_new/internal/dependencies/repository_module.dart';

class TaskService {
  LocalTasksRepository localTasksRepository =
      RepositoryModule.localTasksRepository();
  static const _url = 'https://beta.mrdekk.ru/todobackend/list';
  late int revision = 735;
  Dio? _dio;

  Dio get _dioGetter {
    _dio ??= Dio();
    _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers = {
        "authorization": "Bearer ${Env.token}",
        "X-Last-Known-Revision": revision
      };
      handler.next(options);
    }, onResponse: (e, handler) {
      handler.next(e);
    }));
    return _dio!;
  }

  Future<ApiTaskList> getTasks() async {
    final response = await _dioGetter.get<Map<String, dynamic>>(_url);
    if (response.statusCode == 200) {
      var data = response.data;
      if (data != null) {
        if (revision < data["revision"]) {
          final patchedData = await patchTasks();
          log('Задачи пропатчены');
          revision = patchedData["revision"];
          await localTasksRepository
              .updateLocalFromApi(ApiTaskList.fromApi(patchedData["list"]));
          return ApiTaskList.fromApi(patchedData["list"]);
        } else {
          revision = data["revision"];
          log('Задачи получены с сервера');
          return ApiTaskList.fromApi(data["list"]);
        }
      }
    }
    throw ArgumentError();
  }

  Future postTask(String id, element) async {
    try {
      final postData =
          TaskRequest(task: TaskBody(element: element).toMap()).toApi();
      log('$postData');
      final response = await _dioGetter.post(
        _url,
        data: postData,
      );
      if (response.statusCode == 200) {
        log('Задача добавлена на сервер');
        revision = response.data["revision"];
        return response.data;
      }
      throw ArgumentError();
    } catch (e) {
      log('$e');
    }
  }

  Future patchTasks() async {
    try {
      final localTasks = await localTasksRepository.getLocalTasks();
      final patchData = TaskListRequest(list: localTasks).toMap();
      final response =
          await _dioGetter.patch(_url, data: jsonEncode(patchData));
      if (response.statusCode == 200) {
        revision == response.data["revision"];
        log('${response.data}');
        return response.data;
      }
    } catch (e) {
      log('$e');
    }
  }

  Future deleteTask(String id) async {
    try {
      final response = await _dioGetter.delete('$_url/$id');
      if (response.statusCode == 200) {
        log('Задача удалена на сервере');
        revision = response.data["revision"];
        return;
      }
      throw ArgumentError();
    } catch (e) {
      log('$e');
    }
  }

  Future editTask(element) async {
    try {
      final postData = TaskRequest(task: TaskBody(element: element).toMap());
      final response =
          await _dioGetter.put('$_url/${element.id}', data: postData);
      log('$response');
      if (response.statusCode == 200) {
        log('Задача изменена на сервере');
        revision = response.data["revision"];
        return response.data;
      }
      throw ArgumentError();
    } catch (e) {
      log('$e');
    }
  }
}
