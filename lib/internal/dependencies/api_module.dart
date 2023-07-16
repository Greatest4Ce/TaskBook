import 'package:to_do_list_new/data/server/api_util.dart';
import 'package:to_do_list_new/data/server/service/task_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(TaskService());

  static ApiUtil apiUtil() {
    return _apiUtil;
  }
}
