import 'package:to_do_list_new/data/local_storage/repository/local_tasks_data_repository.dart';
import 'package:to_do_list_new/data/server/repository/tasks_data_repository.dart';
import 'package:to_do_list_new/domain/repository/locals_tasks_repository.dart';
import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';
import 'package:to_do_list_new/internal/dependencies/api_module.dart';
import 'package:to_do_list_new/internal/dependencies/local_storage_module.dart';

class RepositoryModule {
  static late TasksRepository _tasksRepository;
  static late LocalTasksRepository _localTasksRepository;

  static TasksRepository tasksRepository() {
    _tasksRepository = TasksDataRepository(ApiModule.apiUtil());
    return _tasksRepository;
  }

  static LocalTasksRepository localTasksRepository() {
    _localTasksRepository =
        LocalTasksDataRepository(LocalStorageModule.localStorageUtil());
    return _localTasksRepository;
  }
}
