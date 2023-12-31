import 'package:dio/dio.dart';
import 'package:to_do_list_new/data/env/token.dart';
import 'package:to_do_list_new/data/revision/revision.dart';

import '../exeptions/exception.dart';

class AuthInterceptor extends Interceptor {
  final _revision = RevisionProvider();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Content-Type'] = 'application/json; charset=utf-8';
    options.headers['Authorization'] = 'Bearer ${Token.token}';
    options.headers['X-Last-Known-Revision'] = _revision.get();
    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    switch (err.response?.statusCode) {
      case 200:
        break;
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerErrorException();
      default:
        if (err.response?.statusCode == null) {
          throw NotInternetException();
        } else {
          throw UnknownException();
        }
    }
    super.onError(err, handler);
  }
}
