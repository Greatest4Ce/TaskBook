import 'package:to_do_list_new/data/repository/tasks_data_repository.dart';
import 'package:to_do_list_new/domain/repository/tasks_reporsitory.dart';
import 'package:to_do_list_new/internal/dependencies/api_module.dart';

class RepositoryModule {
  static final TasksStateRepository _tasksRepository =
      TasksDataRepository(ApiModule.apiUtil());

  static TasksStateRepository tasksRepository() {
    return _tasksRepository;
  }
}
