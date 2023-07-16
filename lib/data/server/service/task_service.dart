import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:to_do_list_new/data/server/models/api_task_list.dart';
import 'package:to_do_list_new/data/server/request/task_body.dart';

class TaskService {
  static const _url = 'https://beta.mrdekk.ru/todobackend/list';
  late int revision = 0;
  Dio? _dio;

  Dio get _dioGetter {
    _dio ??= Dio();
    _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers = {
        "authorization": 'Bearer underoxidise',
        'X-Last-Known-Revision': revision
      };
      handler.next(options);
    }, onResponse: (e, handler) {
      // log('$e');
      handler.next(e);
    }));
    return _dio!;
  }

  Future<ApiTaskList> getTasks() async {
    final response = await _dioGetter.get<Map<String, dynamic>>(_url);
    if (response.statusCode == 200) {
      final data = response.data;
      if (data != null) {
        revision = data["revision"];
        log('Задачи получены с сервера');
        return ApiTaskList.fromApi(data["list"]);
      }
    }
    throw ArgumentError();
  }

  Future postTask(String id, element) async {
    try {
      final postData = TaskBody(element: element).toApi();
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
      final postData = TaskBody(element: element).toApi();
      final response =
          await _dioGetter.put('$_url/${element.id}', data: postData);
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
