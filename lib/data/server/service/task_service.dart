import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:to_do_list_new/data/revision/local_revision.dart';
import 'package:to_do_list_new/data/revision/revision.dart';
import 'package:to_do_list_new/data/server/interceptors/interceptros.dart';
import 'package:to_do_list_new/data/server/models/models.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';
import 'package:to_do_list_new/internal/dependencies/locator.dart';
import 'package:to_do_list_new/internal/logger/logger.dart';

import '../requests/requests.dart';

class TaskService {
  LocalTasksRepository localTasksRepository = Locator.localTasksRepository;
  static const _url = 'https://beta.mrdekk.ru/todobackend/list';
  final revision = RevisionProvider();
  final locRevision = LocalRevisionProvider();

  late Dio _dio;

  TaskService() {
    _dio = Dio();
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<ApiTaskList> getTasks() async {
    logger.v('GET: $_url');
    final response = await _dio.get<Map<String, dynamic>>(_url);
    if (response.statusCode == 200) {
      var data = response.data;
      logger.v(data);
      if (data != null) {
        if (locRevision.get()) {
          final patchedData = await patchTasks();
          await localTasksRepository
              .updateLocalFromApi(ApiTaskList.fromApi(patchedData["list"]));
          return ApiTaskList.fromApi(patchedData["list"]);
        } else {
          revision.set(data["revision"]);
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
      logger
        ..v('POST: $_url')
        ..v(postData);
      final response = await _dio.post(
        _url,
        data: postData,
      );
      logger.v(response.data);
      revision.set(response.data["revision"]);
      return response.data;
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }

  Future patchTasks() async {
    try {
      final localTasks = await localTasksRepository.getLocalTasks();
      final patchData = TaskListRequest(list: localTasks).toMap();
      logger
        ..v('PATCH: $_url')
        ..v(patchData);
      final response = await _dio.patch(_url, data: jsonEncode(patchData));
      revision.set(response.data["revision"]);
      logger.v(response.data);
      return response.data;
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }

  Future deleteTask(String id) async {
    try {
      logger.v('DELETE: $_url/$id');
      final response = await _dio.delete('$_url/$id');
      logger.v(response.data);
      revision.set(response.data["revision"]);
      return;
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }

  Future<void> editTask(element) async {
    try {
      final postData =
          TaskRequest(task: TaskBody(element: element).toMap()).toApi();
      logger
        ..v('PUT: $_url/${element.id}')
        ..v(postData);
      final response = await _dio.put('$_url/${element.id}', data: postData);
      logger.v(response.data);
      revision.set(response.data["revision"]);
      return response.data;
    } on DioException catch (e) {
      throw e.error as Exception;
    }
  }
}
